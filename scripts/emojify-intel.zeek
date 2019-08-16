@load ./emojifier

module Emojifier;

Intel::match(s: Intel::Seen, items: set [Intel::Item])
	{
	if ( s?$conn )
		s$conn$emoji += "🔥";
	}
