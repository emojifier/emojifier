# @TEST-EXEC: zeek -C -r $TRACES/tls-expired-cert.trace emojify-policies.zeek %INPUT
# @TEST-EXEC: btest-diff conn.log

redef SSL::notify_certs_expiration = ALL_HOSTS;
