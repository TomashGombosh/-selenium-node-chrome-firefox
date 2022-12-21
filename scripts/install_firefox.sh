#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

GECKO_DRIVER_VERSION=$1

apt-get update
add-apt-repository ppa:mozillateam/ppa
echo 'Package: *Pin: release o=LP-PPA-mozillateamPin-Priority: 1001' | sudo tee /etc/apt/preferences.d/mozilla-firefox
echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox
apt-get install -y firefox
snap install firefox
echo "Firefox install successfully"

wget https://github.com/mozilla/geckodriver/releases/download/v${GECKO_DRIVER_VERSION}/geckodriver-v${GECKO_DRIVER_VERSION}-linux64.tar.gz
tar -xvf geckodriver-v${GECKO_DRIVER_VERSION}-linux64.tar.gz
mv geckodriver /usr/bin/
chown root:root /usr/bin/geckodriver
chmod +x /usr/bin/geckodriver
echo "Geckodriver install successfully"

rm -r geckodriver-v${GECKO_DRIVER_VERSION}-linux64.tar.gz
echo "Clean up"
