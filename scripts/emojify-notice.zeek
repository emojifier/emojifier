@load ./emojifier

module Emojifier;

hook Notice::policy(n: Notice::Info) &priority=-10
    {
    if ( n?$conn )
    	{
    	if ( strstr(n$conn$emoji_trail, "🚨") == 0 )
    		n$conn$emoji_trail += "🚨";
    	}
    }
