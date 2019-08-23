# @TEST-EXEC: zeek -C -r $TRACES/wikipedia.pcap emojify-notice.zeek %INPUT
# @TEST-EXEC: btest-diff conn.log

redef enum Notice::Type += {
	Test_Notice,
};

redef Weird::actions: table[string] of Weird::Action += {
	["weird_emoji_test"] = Weird::ACTION_NOTICE,
};

event connection_established(c: connection)
	{
	if ( c$id$resp_h == 208.80.152.3 )
		NOTICE([
			$note=Test_Notice,
			$msg="Emoji test",
			$conn = c]);
	if (c$id$orig_p == 50000/tcp )
		Weird::weird([
			$ts=network_time(),
			$name="weird_emoji_test",
			$conn=c,
			$notice=T]);
	}
