@load ./emojify-notice

@load policy/protocols/ssl/expiring-certs
@load policy/protocols/ssl/weak-keys
@load policy/protocols/ssl/heartbleed
@load policy/protocols/http/detect-sqli
@load policy/frameworks/software/vulnerable
@load policy/protocols/ssh/detect-bruteforcing

module Emojifier;

redef custom_notices: table[Notice::Type] of string += {
	[SSL::Certificate_Expired] = "⌛",
	[SSL::Certificate_Expires_Soon] = "⏳",
	[SSL::Old_Version] = "😕",
	[SSL::Weak_Key] = "😕",
	[Heartbleed::SSL_Heartbeat_Attack] = "💓",
	[Heartbleed::SSL_Heartbeat_Attack_Success] = "💓",
	#TODO: The following are missing a connection but could be implemented differently
	[HTTP::SQL_Injection_Attacker] = "💉",
	[HTTP::SQL_Injection_Victim] = "💉",
	[Software::Vulnerable_Version] = "💣",
	[SSH::Login_By_Password_Guesser] = "🤔",
	} &redef;
