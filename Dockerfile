FROM openjdk:8

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
  sudo \
  vim \
  wget \
  python3-pip \
  && apt-get clean

RUN sudo pip3 install Twisted

RUN mkdir /start

WORKDIR /start

# RUN wget http://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12.2-14.23.4.2760/forge-1.12.2-14.23.4.2760-installer.jar

#RUN java -jar forge-1.12.2-14.23.4.2760-installer.jar --installServer

#RUN rm forge-1.12.2-14.23.4.2760-installer.jar \
#    && rm forge-1.12.2-14.23.4.2760-installer.jar.log

RUN mkdir mods

COPY journeymap-1.12.2-5.5.2.jar mods/

WORKDIR /start/mods

RUN wget https://media.forgecdn.net/files/2518/488/techguns-1.12.2-2.0.1.1.jar

RUN wget https://media.forgecdn.net/files/2609/507/ImmersiveEngineering-0.12-85.jar

RUN wget https://media.forgecdn.net/files/2612/810/Chisel-MC1.12.2-0.2.1.34.jar

RUN wget https://media.forgecdn.net/files/2586/247/CoFHCore-1.12.2-4.5.3.20-universal.jar

RUN wget https://media.forgecdn.net/files/2584/26/CTM-MC1.12.2-0.3.2.18.jar

RUN wget https://media.forgecdn.net/files/2567/260/RedstoneFlux-1.12-2.0.2.3-universal.jar

RUN wget https://media.forgecdn.net/files/2621/95/Minecraft+Transport+Simulator-1.12.2-11.2.0.jar

RUN wget https://media.forgecdn.net/files/2617/230/MTS_Official_Pack_V06.jar

RUN wget https://media.forgecdn.net/files/2544/919/immersivepetroleum-1.12.2-1.1.9.jar

RUN wget https://media.forgecdn.net/files/2614/679/FTBUtilities-5.3.0.49.jar

RUN wget https://media.forgecdn.net/files/2614/919/FTBLib-5.3.0.50.jar

RUN wget https://media.forgecdn.net/files/2460/570/worldedit-forge-mc1.12-6.1.8-dist.jar

RUN wget https://media.forgecdn.net/files/2516/761/RecurrentComplex-1.4.7.jar

RUN wget https://media.forgecdn.net/files/2443/253/IvToolkit-1.3.3-1.12.jar

RUN wget https://media.forgecdn.net/files/2484/281/%5b1.12%5dMoVillages-1.5.4.jar

RUN wget https://media.forgecdn.net/files/2619/944/BlackThorne+Civilian+Pack+%5bMTS%5d+1.10.2-11.0.0-1.1.3.jar

RUN wget https://media.forgecdn.net/files/2613/181/CreativeCore_v1.9.32_mc1.12.2.jar

RUN wget https://media.forgecdn.net/files/2621/13/PTRLib-1.0.3.jar

RUN wget https://media.forgecdn.net/files/2621/15/Decocraft-2.6.2_1.12.2.jar

RUN wget https://media.forgecdn.net/files/2573/710/leverbuttonlights-1.12.2-3.2.9.jar

RUN wget https://media.forgecdn.net/files/2585/469/LightingWand-1.0.4.jar

RUN wget https://media.forgecdn.net/files/2619/943/UNU+Parts+Pack+%5bMTS%5d+1.10.2-11.0.0-1.1.3.jar

RUN wget https://media.forgecdn.net/files/2620/86/MTS_Heavy_Industrial_by_AdamRK_1.8.0.jar

RUN wget https://media.forgecdn.net/files/2590/442/OnlinePicFrame_v1.4.19_mc1.12.2.jar

RUN wget https://media.forgecdn.net/files/2594/241/ChickenChunks-1.12.2-2.4.1.73-universal.jar

RUN wget https://media.forgecdn.net/files/2618/630/CodeChickenLib-1.12.2-3.2.2.353-universal.jar

RUN wget https://media.forgecdn.net/files/2463/318/ModernLights-1.0.3_1.12.jar

RUN wget https://media.forgecdn.net/files/2568/579/immersivetech-1.12-1.3.10.jar

RUN wget https://media.forgecdn.net/files/2615/203/ImmersiveRailroading-1.3.3_1.12.jar

RUN wget https://media.forgecdn.net/files/2551/739/IGW-Mod-1.12.2-1.4.4-15-universal.jar

RUN wget https://media.forgecdn.net/files/2535/626/TrackAPI-1.1_1.12.jar

RUN wget https://media.forgecdn.net/files/2540/146/OpenComputers-MC1.12.2-1.7.2.67.jar

RUN wget https://media.forgecdn.net/files/2623/931/CraftTweaker2-1.12-4.1.10.jar

# copy repo files to root folder
WORKDIR /start

COPY server.properties\
     eula.txt\
     startup.py\
     __init__.py\
     libraries/\
     forge-1.12.2-14.23.4.2760-universal.jar\
     minecraft_server.1.12.2.jar\
     ./

RUN mkdir /start/config
RUN mkdir /start/scripts

COPY config/* /start/config/
COPY scripts/ /start/scripts/

# install immersiverailroading stock resource pack
RUN mkdir /start/config/immersiverailroading
RUN mkdir /start/resourcepacks
WORKDIR /start/config/immersiverailroading

RUN wget -O heavy_industrial.zip https://media.forgecdn.net/files/2580/642/Heavy%2BIndustrial%2B1.4.2.1%2Bby%2Badam%2Br%2Bk.zip

RUN wget -O Amtrak.zip https://media.forgecdn.net/files/2603/398/Amtrak%2B.zip

RUN wget -O Japanese_Electric_Locomotive.zip https://media.forgecdn.net/files/2610/625/Japanese+Electric+Locomotive+Pack.zip

RUN cp heavy_industrial.zip\
    Amtrak.zip\
    Japanese_Electric_Locomotive.zip\
    /start/resourcepacks/

# expose port
EXPOSE 25565/udp
EXPOSE 25565/tcp
EXPOSE 25568/tcp

RUN mkdir /home/minecraft
# change password after build
RUN useradd minecraft -p tfc -d /home/minecraft

RUN chown minecraft:minecraft /home/minecraft

RUN chown minecraft:minecraft /start/* -R

RUN chmod a+r /start -R

WORKDIR /home/minecraft

USER minecraft

VOLUME ["/home/minecraft"]

# CMD ["/usr/bin/python3", "/home/minecraft/startup.py"]
