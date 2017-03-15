echo -e "$SERVER_CRT" > /config/server.crt
echo -e "$SERVER_KEY" > /config/server.key

nghttpx -s -k --no-ocsp -f'*,8443' -b127.0.0.1,8080 /config/server.key /config/server.crt
tinyproxy -d -c /config/tinyproxy.conf
