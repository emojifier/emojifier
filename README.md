<img src="docs/emojifier_logo.png" width="240" height="240" />

# Set your logs on fire with Emoji-🔥

Emojifier is the 🔨 of choice to get a fast overview on your [Zeek](https://www.zeek.org/) connection log.
On top, it also serves as the perfect management summary of your network's security status. 👹🛡️🏢

It adds an additional column to your conn.log showing emojis that give you information about the connections in your log.
The following emojis are currently supported:

| Emoji | Meaning                                |
| ----- | -------------------------------------- |
| 🏄    | HTTP Traffic                           |
| 🔍    | DNS Traffic                            |
| 📨    | SMTP Traffic                           |
| ☎️    | SIP Traffic                            |
| 🥵    | Connection with many bytes             |
| 🙈    | Some bytes were missed                 |
| 😛    | TCP Connection was rejected            |
| 🔄    | Connection direction was flipped       |
| 🚨    | There is a notice for this connection  |
| 🥴    | Zeek deems this connection weird       |
| 🔥    | There was an Intel hit                 |

Furthermore, there is an additional script to emojify default policies.
Add `@load emojifier/emojify-policies` to your `local.zeek` to enable the following additional emojis:

| Emoji | Meaning                                |
| ----- | -------------------------------------- |
| ⌛    | Expired certificate                    |
| ⏳    | Certificate expires soon               |
| 😕    | Old TLS version                        |
| 💓    | Heartbleed attack detected             |
| 💉    | SQL injection detected                 |
| 💣    | Vulnerable software version            |
| 🤔    | Login with guessed SSH password        |

### Usage 😎

The scripts are available as package for the [Zeek Package Manager](https://github.com/zeek/package-manager) and can be installed using the following command: `zkg install emojifier`
To set your logs on 🔥 make sure the package is loaded: `zkg load emojifier`
To enable the additional emojis including the corresponding policy scripts add `@load emojifier/emojify-policies` to your `local.zeek`.
Please note that emojification (utf8 support) is a Zeek-only feature. If you haven't already upgraded to Zeek, 👆 is the reason you should do it!

### Fun with Flags 🇩🇪 🇺🇸 🇯🇲

Of course, we have also added support for Zeek's GeoLocation framework. First you need to make sure that the framework is available (see [Zeek Docs](https://docs.zeek.org/en/current/frameworks/geoip.html)). For a quick test run a command like the following:
```
zeek -e "print lookup_location(8.8.8.8);"
```
If that works without any issues, you are ready to go. Just add `@load emojifier/emojify-geo` to your `local.zeek`.

### Extending 🧐

Want to put 🔥? No problem, the emojifier can be easily extended. Just add your custom logic by handling an event and concatenating the additional emoji to the `emoji_trail` string in the `connection` record. The following example adds the 🕳 emoji.
```zeek
event connection_state_remove(c: connection) &priority=5
	{
	if ( c?$tunnel )
		c$emoji_trail += "🕳";
	}
```
Note that you need to use a priority > 0 in case you are handling the `connection_state_remove` event.

If you want to extend the Emoji-🔥 based on notices that is even easier. You just need to extend the `Emojifier::custom_notices` table:
```zeek
redef custom_notices += {
	[Notice::Tally] = "🤭",
};
```
We are looking forward to merge your pull-request 😉
