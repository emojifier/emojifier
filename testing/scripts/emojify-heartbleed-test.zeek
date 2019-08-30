# @TEST-EXEC: zeek -C -r $TRACES/heartbleed-success.pcap emojify-policies.zeek
# @TEST-EXEC: btest-diff conn.log