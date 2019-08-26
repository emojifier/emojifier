@load ./emojifier

module Emojifier;

event dns_request(c: connection, msg: dns_msg, query: string, qtype: count, qclass: count)
	{
	if (/.de$/ in query)
		c$emoji_trail += "🇩🇪";
	if (/.fr$/ in query)
		c$emoji_trail += "🇫🇷";
	if (/.in$/ in query)
		c$emoji_trail += "🇮🇳";
	}