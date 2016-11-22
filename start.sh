#/bin/sh

echo "copy files to working directory..."
cp -rpn /start/* /home/minecraft/

su minecraft

echo "files copied, starting server..."

python ./startup.py