##! This script sets your logs on 🔥!

module Emojifier;

redef record Conn::Info += {
	emoji: string &default="🙂" &log;
};

redef LogAscii::enable_utf_8 = T;

event connection_state_remove(c: connection)
    {
    if ( c$conn?$resp_bytes && c$conn$resp_bytes > 700 )
        c$conn$emoji = "🥵";
    }
