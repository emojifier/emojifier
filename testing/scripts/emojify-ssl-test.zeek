# @TEST-EXEC: zeek -C -r $TRACES/ssl-v2.trace emojify-policies.zeek %INPUT
# @TEST-EXEC: btest-diff conn.log

redef SSL::notify_weak_keys = ALL_HOSTS;
redef SSL::notify_minimal_key_length = 4096;
