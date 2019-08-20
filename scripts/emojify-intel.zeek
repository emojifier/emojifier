@load ./emojifier

module Emojifier;

event Intel::match(s: Intel::Seen, items: set [Intel::Item])
	{
	if ( s?$conn )
		s$conn$emoji_trail += "🔥";
	}
