# @TEST-EXEC: zeek -C -r $TRACES/wikipedia.pcap emojify-geo.zeek
# @TEST-EXEC: btest-diff conn.log
