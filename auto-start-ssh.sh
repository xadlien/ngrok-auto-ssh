EMAIL_ADDR=YOUREMAILHERE

/home/ngrok/bin/ngrok tcp 22 --log=/tmp/ngrok > /dev/null &
sleep 10
API_URL=$(curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url )
mailx -s "$HOSTNAME NGROK SSH ADDRESS" $EMAIL_ADDR <<< $API_URL
tail -f /tmp/ngrok