#!/bin/bash

# Check for root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

# Destination directory (default is /usr/local/bin)
INSTALL_DIR="/usr/local/bin"

# Copy sap.sh to the installation directory
cp sap.sh $INSTALL_DIR/sap
chmod +x $INSTALL_DIR/sap

echo "Installation complete. You can now run 'sap' from anywhere."
