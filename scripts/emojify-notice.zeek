@load ./emojifier

module Emojifier;

export {
	const custom_notices: table[Notice::Type] of string = {
		[Weird::Activity] = "🥴",
		} &redef;
}

hook Notice::policy(n: Notice::Info) &priority=-10
	{
	if ( n?$conn )
		{
		if ( n$note in custom_notices )
			{
			local emoji = custom_notices[n$note];
			if ( strstr(n$conn$emoji_trail, emoji) == 0 )
				n$conn$emoji_trail += emoji;
			}
		else if ( strstr(n$conn$emoji_trail, "🚨") == 0 )
			n$conn$emoji_trail += "🚨";
		}
	}
