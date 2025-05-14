#!/bin/bash -e

# Install Docker and dependencies
apt-get update && apt-get install -y docker.io docker-compose git

# Create PumpkinPiEye install directory
mkdir -p /opt/pumpkinpieye

# Clone PumpkinPiEye repo
git clone https://github.com/yourusername/pumpkinpieye.git /opt/pumpkinpieye || echo "Replace with your repo URL"

# Ensure ownership
chown -R 1000:1000 /opt/pumpkinpieye

# Add start script to rc.local
echo '#!/bin/bash' > /etc/rc.local
echo '/opt/pumpkinpieye/scripts/start_all.sh &' >> /etc/rc.local
chmod +x /etc/rc.local
