FROM openjdk:8

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
  sudo \
  vim \
  wget \
  && apt-get clean

RUN mkdir /home/minecraft
 
# change password after build
RUN useradd minecraft -p tfc -d /home/minecraft

RUN chown minecraft:minecraft /home/minecraft

WORKDIR /home/minecraft

RUN wget http://files.minecraftforge.net/maven/net/minecraftforge/forge/1.7.10-10.13.4.1558-1.7.10/forge-1.7.10-10.13.4.1558-1.7.10-installer.jar

RUN chown minecraft:minecraft forge-1.7.10-10.13.4.1558-1.7.10-installer.jar

RUN chmod a+x forge-1.7.10-10.13.4.1558-1.7.10-installer.jar

USER minecraft

RUN java -jar forge-1.7.10-10.13.4.1558-1.7.10-installer.jar --installServer

RUN rm forge-1.7.10-10.13.4.1558-1.7.10-installer.jar

COPY server.properties ops.json eula.txt startup.py __init__.py ./

RUN mkdir mods

COPY Decorations-1.0.20.jar mods/

USER root

# RUN chmod a+x startup.sh

RUN chown minecraft:minecraft startup.py __init__.py server.properties ops.json eula.txt mods/Decorations-1.0.20.jar

USER minecraft

WORKDIR /home/minecraft/mods

RUN wget https://bitly.com/Build79-29 && mv Build79-29 [1.7.10]TerraFirmaCraft-0.79.29.922.jar

RUN wget http://files.forgeessentials.com/forgeessentials-1.7.10-server.jar

RUN wget http://files.player.to/fastcraft-1.23.jar

RUN wget https://mods.curse.com/mc-mods/minecraft/journeymap-32274/2296716# && mv 2296716 journeymap-1.7.10-5.1.4p1-unlimited.jar

EXPOSE 25565/udp

WORKDIR /home/minecraft

RUN mkdir world

VOLUME ["/home/minecraft/world"]

# CMD ["/usr/bin/python", "/home/minecraft/startup.py"]
