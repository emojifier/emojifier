# @TEST-EXEC: zeek -C -r $TRACES/wikipedia.pcap emojify-intel.zeek %INPUT
# @TEST-EXEC: btest-diff conn.log

# @TEST-START-FILE intel.dat
#fields	indicator	indicator_type	meta.source	meta.desc	meta.url
141.142.220.118	Intel::ADDR	source1	this ip bad	http://some-data-distributor.com/1
# @TEST-END-FILE

# Load default seen scripts
@load frameworks/intel/seen
redef Intel::read_files += { "intel.dat" };
