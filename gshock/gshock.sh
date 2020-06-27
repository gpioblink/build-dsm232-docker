#!/bin/sh
cp gshock/inject-files/app.sh app/
cd app
tar -C /env/ott/gshock/inject-files/ -czf app.tgz $(ls -1 /env/ott/gshock/inject-files/)
mkimg -A ARM -C none -T app -n DSM232_APP_Image -d app.tgz app.img
mkimg -A ARM -C none -T multi -n DSM232_Multi_Image -d app.img full.img
