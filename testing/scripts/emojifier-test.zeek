# @TEST-EXEC: zeek -C -r $TRACES/wikipedia.pcap emojifier.zeek
# @TEST-EXEC: btest-diff conn.log
