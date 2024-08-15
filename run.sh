rm -rf /usr/local/bin/fbcp
sudo cp fbcp /usr/local/fbcp
sudo tee /etc/rc.local > /dev/null << 'EOF'
#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.

# Print the IP address
fbcp&
_IP=$(hostname -I) || true
if [ "$_IP" ]; then
  printf "My IP address is %s\n" "$_IP"
fi

exit 0
EOF
sudo reboot
