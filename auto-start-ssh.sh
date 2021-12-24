/home/ngrok/bin/ngrok tcp 22 &
API_URL=$(curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url )
mailx -r xadlien@gmail.com -s "$HOSTNAME NGROK SSH ADDRESS: $API_URL" xadlien@gmail.com
fg