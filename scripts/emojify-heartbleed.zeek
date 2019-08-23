@load ./emojify-notice
@load policy/protocols/ssl/heartbleed

module Emojifier;

redef custom_notices: table[Notice::Type] of string += {
	[Heartbleed::SSL_Heartbeat_Attack] = "💓",
    [Heartbleed::SSL_Heartbeat_Attack_Success] = "💓",
	} &redef;
