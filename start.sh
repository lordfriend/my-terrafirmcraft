#/bin/sh

echo "copy files to working directory..."
cp -rpn /start/* /home/minecraft/

su minecraft

echo "files copied, starting server..."
cd /home/minecraft

python ./startup.py