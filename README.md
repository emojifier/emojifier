<img src="docs/emojifier_logo.png" width="240" height="240" />

# Emoji-🔥

#### Set your logs on fire with Emoji-🔥!

Emojifier is the 🔨 of choice to get a fast overview on your [Zeek](https://www.zeek.org/) connection log.
On top, it also serves as the perfect management summary of your network's security status. 👹🛡️🏢

It adds an additional column to your conn.log showing emojis that give you information about the connections in your log.
The following emojis are currently supported:

| Emoji | Meaning                                |
| ----- | -------------------------------------- |
| 🏄    | HTTP Traffic                           |
| 🔍    | DNS Traffic                            |
| 📨    | SMTP Traffic                           |
| ☎️    | SIP Traffic                            |
| 🥵    | Connection with many bytes             |
| 🙈    | Some bytes were missed                 |
| 😛    | TCP Connection was rejected            |
| 🔄    | Connection direction was flipped       |
| 🚨    | There is a notice for this connection  |
| 🥴    | Zeek deems this connection weird       |
| 🔥    | There was an Intel hit                 |

Furthermore, there is an additional script to emojify default policies.
Add `@load emojifier/emojify-policies` to your `local.zeek` to enable the following additional emojis:

| Emoji | Meaning                                |
| ----- | -------------------------------------- |
| ⌛    | Expired certificate                    |
| ⏳    | Certificate expires soon               |
| 😕    | Old TLS version                        |
| 💓    | Heartbleed attack detected             |
| 💉    | SQL injection detected                 |
| 💣    | Vulnerable software version            |
| 🤔    | Login with guessed SSH password        |

### Coming soon

Prepare yourself for fun with flags 🇩🇪 🇺🇸 🇯🇲! We are about to add Geo-IP-Support...
