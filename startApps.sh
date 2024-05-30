#!/bin/bash
stty -F /dev/serial0 raw 9600 cs8 clocal -cstopb #ready the serial port for reading from Adafruit Ultimate GPS HAT
sudo gpsd /dev/serial0 -F /var/run/gpsd.sock

cd /home/darthmancus/BerryAuto

#start the apps
/home/darthmancus/.nvm/versions/node/v22.2.0/bin/node index.js & #need to manually specify installation dir if node was installed by nvm

python3 tempMonitor.py &
python3 obdDash.py &
python3 imuSensor.py &
python3 gpsModule.py &
python3 airSensor.py &
python3 obdMisc.py &

#cd /home/pi/piDashcam
#sudo python3 dashcam.py &

chromium-browser --window-position=0,0    --kiosk --user-data-dir="/home/darthmancus/Documenti/Profiles/0" http://localhost:3000 &
chromium-browser --window-position=600,0    --kiosk --user-data-dir="/home/darthmancus/Documenti/Documents/Profiles/1" http://localhost:3000/misc &
