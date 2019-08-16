##! This script sets your logs on 🔥!

module Emojifier;

redef record Conn::Info += {
	emoji: string &default="" &log;
};

redef LogAscii::enable_utf_8 = T;

event connection_state_remove(c: connection)
    {
    if ( c$conn?$resp_bytes && c$conn$resp_bytes > 700 )
        c$conn$emoji += "🥵";
    if ( c$conn?$service && /dns/ in c$conn$service )
		c$conn$emoji += "🔍";
	if ( /REJ/ in c$conn$conn_state )
		c$conn$emoji += "😛";
	if ( c$conn?$resp_bytes && c$conn$missed_bytes > 0 )
        c$conn$emoji += "🙈";
    }
