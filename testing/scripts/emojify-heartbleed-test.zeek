# @TEST-EXEC: zeek -C -r $TRACES/heartbleed-success.pcap emojify-heartbleed.zeek
# @TEST-EXEC: btest-diff conn.log