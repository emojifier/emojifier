##! This script sets your logs on 🔥!

module Emojifier;

export {
	## 🥵-threshold in bytes for a connection. Connection size is defined as
	## :zeek:id:`orig_bytes` + :zeek:id:`resp_bytes`.
	option conn_size_threshold: count = 1000;
}

redef record Conn::Info += {
	emoji: string &default="" &log;
};

redef record connection += {
	emoji_trail: string &default="";
};

redef LogAscii::enable_utf_8 = T;

event connection_state_remove(c: connection)
	{
	c$conn$emoji = c$emoji_trail;

	local conn_size = 0;
	conn_size += c$conn?$orig_bytes ? c$conn$orig_bytes : 0;
	conn_size += c$conn?$resp_bytes ? c$conn$resp_bytes : 0;
	if ( conn_size >= conn_size_threshold )
		c$conn$emoji += "🥵";
	if ( c$conn?$resp_bytes && c$conn$missed_bytes > 0 )
		c$conn$emoji += "🙈";

	if ( c$conn?$service && /dns/ in c$conn$service )
		c$conn$emoji += "🔍";
	if ( c$conn?$service && /http/ in c$conn$service )
		c$conn$emoji += "🏄";
	if ( c$conn?$service && /sip/ in c$conn$service )
		c$conn$emoji += "☎️";
	if ( c$conn?$service && /smtp/ in c$conn$service )
		c$conn$emoji += "📨";

	if ( /REJ/ in c$conn$conn_state )
		c$conn$emoji += "😛";
	if ( c$conn?$history && /^/ in c$conn$history )
		c$conn$emoji += "🔄";
	}
