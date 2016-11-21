# My Terrafirmacraft Server

This is a config file for a very simple Terrafirmacraft Server

### run docker container

```bash
docker build -t minecraft .
docker run -d -P -v /home/hostuser/world/:/home/minecraft/world minecraft python ./startup.py
```

