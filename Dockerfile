FROM openjdk:8

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
  sudo \
  vim \
  wget \
  && apt-get clean

RUN mkdir /start

WORKDIR /start

RUN wget http://files.minecraftforge.net/maven/net/minecraftforge/forge/1.7.10-10.13.4.1558-1.7.10/forge-1.7.10-10.13.4.1558-1.7.10-installer.jar

RUN java -jar forge-1.7.10-10.13.4.1558-1.7.10-installer.jar --installServer

RUN rm forge-1.7.10-10.13.4.1558-1.7.10-installer.jar \
    && rm forge-1.7.10-10.13.4.1558-1.7.10-installer.jar.log

COPY server.properties eula.txt startup.py start.sh __init__.py ./

RUN mkdir mods

COPY Decorations-1.0.20.jar journeymap-1.7.10-5.1.4p1-unlimited.jar mods/

WORKDIR /start/mods

RUN wget https://bitly.com/Build79-29 && mv Build79-29 [1.7.10]TerraFirmaCraft-0.79.29.922.jar

RUN wget http://files.forgeessentials.com/forgeessentials-1.7.10-server.jar

RUN wget http://files.player.to/fastcraft-1.23.jar

EXPOSE 25565/udp

RUN mkdir /home/minecraft
# change password after build
RUN useradd minecraft -p tfc -d /home/minecraft

RUN chown minecraft:minecraft /home/minecraft

RUN chown minecraft:minecraft /start/* -R

RUN chmod a+x /start/start.sh

VOLUME ["/home/minecraft"]

# CMD ["/usr/bin/python", "/home/minecraft/startup.py"]
