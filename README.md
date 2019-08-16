# Intel Expire

This package provides an expiration mechanism for Zeek's intelligence framework on per item basis.

## Installation

The scripts are available as package for the [Bro/Zeek Package Manager](https://github.com/zeek/package-manager) and can be installed using the following command: `bro-pkg install intel-expire`

## General Usage

To enable per item expiration make sure the package is loaded: `bro-pkg load intel-expire`

Once enabled, intel items might specify a new meta data field `meta.expire`, which indicates the expiration interval in seconds. The following example shows an intel file that contains two IPs that are valid for different timespans.
```
#fields	indicator	indicator_type	meta.source	meta.desc	meta.expire
10.0.0.23	Intel::ADDR	source_a	This host is bad	600
10.0.0.42	Intel::ADDR	source_b	This host is bad	18000
```
Once an item expires, the hook `single_item_expired` is called. If all hook handlers are executed, the expiration timeout will be reset. Otherwise, if one of the handlers terminates using `break`, the item will be removed. This allows to make use of per item expiration for executing arbitrary actions.

**NOTE:** As described above, item expiration will _not_ cause that the item is removed upon expiration by default. If you would like to remove expired items add the following to your `local.bro`
```
@load packages/intel-expire/delete-expired
```
or break the chain of hook handlers manually:
```
hook Intel::single_item_expired(item: Intel::Item)
	{
	# Trigger item deletion
	break;
	}
```

## Extensions

The following additional scripts can be used to further customize the behavior of per item expiration:

* `delete-expired`: Expired items will be deleted.
* `reset-on-match`: Matching an item will reset its expiration timeout.

## Background

The script `item-expire.bro` implements per item expiration and is loaded by default. Per item expiration is realized using two additional meta data fields:
* `expire` defines the expiration interval in seconds
* `start_time` represents the start timestamp of the expiration

To make sure that an expired item does not match, the script handles the `extend_match` hook of the intelligence framework and checks whether the item to match has already expired with regard to its expiration start time and expiration interval.
The term item refers to the combination of an indicator and a corresponding meta data instance (see [blog post](https://blog.zeek.org/2016/12/the-intelligence-framework-update.html) for details about the internal data model of the intelligence framework).
If the item has expired, the `single_item_expired` hook is called. As previously described, breaking the chain of hooks will cause the item under consideration to be removed. Otherwise, expiration is reset by setting the start timestamp to to current network time. Updating the meta data is implemented using the intelligence framework's `insert` function. Note that this does _not_ cause the item to be redistributed in the cluster, because only the item's meta data is updated.

At this point, the `single_item_expired` hook would never be called if the corresponding item is not matched. If expiration is used to delete items, deletion would not be triggered and items would pile up. To prevent this, the script implements a mechanism akin to garbage collection using the intelligence framework's global expiration.
Setting the `item_expiration` timeout to 10 minutes by default, the `item_expired` hook is called regularly for each indicator. In context of the hook the expiration for each indicator and meta data combination is checked and per item expiration is triggered accordingly. Thus, the garbage collection behavior can be influenced by tuning the global item expiration timeout.

For further details see the test cases contained in the package.
