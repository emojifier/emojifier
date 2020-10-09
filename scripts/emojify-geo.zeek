@load ./emojifier

module Emojifier;

function code_to_hex(c: count): string
	{
	local c0 = c & 0x3F;
	c = (c & ~0x3F) / 64;
	local c1 = c & 0x3F;
	c = (c & ~0x3F) / 64;
	local c2 = c & 0x3F;
	c = (c & ~0x3F) / 64;

	return hexstr_to_bytestring(fmt("%x%x%x%x",
		c  + 0xF0,
		c2 + 0x80,
		c1 + 0x80,
		c0 + 0x80));
	}

function to_flag(code: string): string
	{
	local c0 = bytestring_to_count(to_upper(code[0])) + 0x01f1a5;
	local c1 = bytestring_to_count(to_upper(code[1])) + 0x01f1a5;
	return cat(code_to_hex(c0), code_to_hex(c1));
	}

event connection_state_remove(c: connection) &priority=5
	{
	local orig_loc = lookup_location(c$id$orig_h);
	if ( orig_loc?$country_code )
		c$emoji_trail += to_flag(orig_loc$country_code);

	local resp_loc = lookup_location(c$id$resp_h);
	if ( resp_loc?$country_code )
		c$emoji_trail += to_flag(resp_loc$country_code);
	}
