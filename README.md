# ngrok-auto-ssh
Systemd service setup for ngrok ssh enpoint with emailed ip address.
## Setup
Make sure to edit setup.sh with your own auth token on line 21 in setup.sh. Also, add your own email to the top of auto-start-ssh.sh.
```bash
sudo bash -x setup.sh
```