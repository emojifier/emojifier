# @TEST-EXEC: zeek -C -r $TRACES/wikipedia.pcap emojify-notice.zeek %INPUT
# @TEST-EXEC: btest-diff conn.log

redef enum Notice::Type += {
	Test_Notice,
};

event connection_established(c: connection)
	{
	if ( c$id$resp_h == 208.80.152.2 )
		NOTICE([
			$note=Test_Notice,
			$msg="Emoji test",
			$conn = c]);
	}
