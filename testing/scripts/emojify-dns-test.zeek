# @TEST-EXEC: zeek -C -r $TRACES/smtp.pcap emojify-dns.zeek %INPUT
# @TEST-EXEC: btest-diff conn.log
