FROM openjdk:8

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
  sudo \
  vim \
  wget \
  python-twisted \
  && apt-get clean

RUN mkdir /start

WORKDIR /start

RUN wget http://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12.2-14.23.4.2760/forge-1.12.2-14.23.4.2760-installer.jar

RUN java -jar forge-1.12.2-14.23.4.2760-installer.jar --installServer

RUN rm forge-1.12.2-14.23.4.2760-installer.jar \
    && rm forge-1.12.2-14.23.4.2760-installer.jar.log

COPY server.properties eula.txt startup.py __init__.py ./

RUN mkdir mods

COPY journeymap-1.12.2-5.5.2.jar mods/

WORKDIR /start/mods

RUN wget https://media.forgecdn.net/files/2518/488/techguns-1.12.2-2.0.1.1.jar

RUN wget https://media.forgecdn.net/files/2609/507/ImmersiveEngineering-0.12-85.jar

RUN wget https://media.forgecdn.net/files/2612/810/Chisel-MC1.12.2-0.2.1.34.jar

RUN wget https://media.forgecdn.net/files/2586/247/CoFHCore-1.12.2-4.5.3.20-universal.jar

RUN wget https://media.forgecdn.net/files/2584/26/CTM-MC1.12.2-0.3.2.18.jar

RUN wget https://media.forgecdn.net/files/2567/260/RedstoneFlux-1.12-2.0.2.3-universal.jar

RUN wget https://media.forgecdn.net/files/2563/327/Minecraft+Transport+Simulator-1.12.2-10.1.2.jar

RUN wget https://media.forgecdn.net/files/2551/964/MTS_Offical_Pack_V04.jar

RUN wget https://media.forgecdn.net/files/2544/919/immersivepetroleum-1.12.2-1.1.9.jar

RUN wget https://media.forgecdn.net/files/2614/679/FTBUtilities-5.3.0.49.jar

RUN wget https://media.forgecdn.net/files/2614/919/FTBLib-5.3.0.50.jar

RUN wget https://media.forgecdn.net/files/2460/570/worldedit-forge-mc1.12-6.1.8-dist.jar

# RUN wget http://files.forgeessentials.com/forgeessentials-1.7.10-server.jar

EXPOSE 25565/udp

RUN mkdir /home/minecraft
# change password after build
RUN useradd minecraft -p tfc -d /home/minecraft

RUN chown minecraft:minecraft /home/minecraft

RUN chown minecraft:minecraft /start/* -R

RUN chmod a+r /start -R

WORKDIR /home/minecraft

USER minecraft

VOLUME ["/home/minecraft"]

# CMD ["/usr/bin/python", "/home/minecraft/startup.py"]
