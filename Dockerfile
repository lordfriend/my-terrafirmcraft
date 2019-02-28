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

# RUN wget http://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12.2-14.23.4.2760/forge-1.12.2-14.23.4.2760-installer.jar

#RUN java -jar forge-1.12.2-14.23.4.2760-installer.jar --installServer

#RUN rm forge-1.12.2-14.23.4.2760-installer.jar \
#    && rm forge-1.12.2-14.23.4.2760-installer.jar.log

RUN mkdir /start/oc_message_broker

RUN mkdir /start/libraries
RUN mkdir /start/config
RUN mkdir /start/scripts
RUN mkdir /start/mods

# install immersiverailroading stock resource pack
RUN mkdir /start/config/immersiverailroading
RUN mkdir /start/resourcepacks

# locked mods not expecting to change

WORKDIR /start/mods

RUN wget https://media.forgecdn.net/files/2612/810/Chisel-MC1.12.2-0.2.1.34.jar

RUN wget https://media.forgecdn.net/files/2586/247/CoFHCore-1.12.2-4.5.3.20-universal.jar

RUN wget https://media.forgecdn.net/files/2584/26/CTM-MC1.12.2-0.3.2.18.jar

RUN wget https://media.forgecdn.net/files/2567/260/RedstoneFlux-1.12-2.0.2.3-universal.jar

RUN wget https://media.forgecdn.net/files/2544/919/immersivepetroleum-1.12.2-1.1.9.jar

RUN wget https://media.forgecdn.net/files/2623/999/FTBUtilities-5.3.0.52.jar

RUN wget https://media.forgecdn.net/files/2625/772/FTBLib-5.3.0.56.jar

RUN wget https://media.forgecdn.net/files/2460/570/worldedit-forge-mc1.12-6.1.8-dist.jar

# RUN wget https://media.forgecdn.net/files/2516/761/RecurrentComplex-1.4.7.jar

# RUN wget https://media.forgecdn.net/files/2443/253/IvToolkit-1.3.3-1.12.jar

RUN wget https://media.forgecdn.net/files/2484/281/%5b1.12%5dMoVillages-1.5.4.jar

RUN wget https://media.forgecdn.net/files/2613/181/CreativeCore_v1.9.32_mc1.12.2.jar

RUN wget https://media.forgecdn.net/files/2621/13/PTRLib-1.0.3.jar

RUN wget https://media.forgecdn.net/files/2621/15/Decocraft-2.6.2_1.12.2.jar

RUN wget https://media.forgecdn.net/files/2573/710/leverbuttonlights-1.12.2-3.2.9.jar

RUN wget https://media.forgecdn.net/files/2585/469/LightingWand-1.0.4.jar

RUN wget https://media.forgecdn.net/files/2590/442/OnlinePicFrame_v1.4.19_mc1.12.2.jar

RUN wget https://media.forgecdn.net/files/2594/241/ChickenChunks-1.12.2-2.4.1.73-universal.jar

RUN wget https://media.forgecdn.net/files/2618/630/CodeChickenLib-1.12.2-3.2.2.353-universal.jar

RUN wget https://media.forgecdn.net/files/2463/318/ModernLights-1.0.3_1.12.jar

RUN wget https://media.forgecdn.net/files/2568/579/immersivetech-1.12-1.3.10.jar

RUN wget https://media.forgecdn.net/files/2657/72/ImmersiveRailroading-1.5.0_1.12-402.jar

RUN wget https://media.forgecdn.net/files/2551/739/IGW-Mod-1.12.2-1.4.4-15-universal.jar

RUN wget https://media.forgecdn.net/files/2535/626/TrackAPI-1.1_1.12.jar

RUN wget https://media.forgecdn.net/files/2670/112/OpenComputers-MC1.12.2-1.7.4.153.jar

RUN wget https://media.forgecdn.net/files/2623/931/CraftTweaker2-1.12-4.1.10.jar

#RUN wget https://media.forgecdn.net/files/2488/533/Drones-0.3.0.jar

RUN wget https://media.forgecdn.net/files/2676/501/ImmersiveEngineering-0.12-89.jar

RUN wget https://media.forgecdn.net/files/2505/781/NoSpawnZone-1.12.2.1.3.jar

RUN wget https://media.forgecdn.net/files/2568/8/VanillaSatchels-1.12.2-1.0.0.1-universal.jar

RUN wget https://media.forgecdn.net/files/2526/670/malisiscore-1.12.2-6.4.0.jar
RUN wget https://media.forgecdn.net/files/2526/679/malisisblocks-1.12.2-6.1.0.jar
RUN wget https://media.forgecdn.net/files/2526/674/malisisdoors-1.12.2-7.3.0.jar

# RUN wget https://github.com/lordfriend/Techguns2/releases/download/2.0.1.3/techguns-1.12.2-2.0.1.3.jar

RUN wget https://media.forgecdn.net/files/2624/386/architecturecraft-1.12-3.80.jar
#RUN wget https://media.forgecdn.net/files/2468/490/WinterWonderLand-1.2.2.jar

RUN wget https://coros.us/mods/modsystem/dl/coroutil-1.12.1-1.2.15.jar
RUN wget https://coros.us/mods/modsystem/dl/weather2-1.12.1-2.6.12.jar
RUN wget https://media.forgecdn.net/files/2625/165/obfuscate-0.2.6-1.12.2.jar

RUN wget https://media.forgecdn.net/files/2650/475/SereneSeasons-1.12.2-1.2.15-universal.jar
RUN wget https://media.forgecdn.net/files/2644/652/ToughAsNails-1.12.2-3.1.0.139-universal.jar
RUN wget https://media.forgecdn.net/files/2644/656/FamiliarFauna-1.12.2-1.0.11.jar

RUN wget https://media.forgecdn.net/files/2663/717/chiselsandbits-14.30.jar
# mowziesmobs depends on llibrary, this is the latest version which support forge 2768
RUN wget https://media.forgecdn.net/files/2598/753/llibrary-1.7.15-1.12.2.jar
RUN wget https://media.forgecdn.net/files/2674/555/mowziesmobs-1.5.3.jar
RUN wget https://media.forgecdn.net/files/2643/742/GrimoireOfGaia3-1.12.2-1.6.8.jar

RUN wget https://media.forgecdn.net/files/2539/562/questbook-3.1.1-1.12.jar
RUN wget https://media.forgecdn.net/files/2669/773/StandardExpansion-3.4.151.jar
RUN wget https://media.forgecdn.net/files/2669/769/BetterQuesting-3.5.291.jar
RUN wget https://media.forgecdn.net/files/2660/317/trafficcontrol-0.0.2.jar
# jei need on server otherwise IR item cannot be cheated
RUN wget https://media.forgecdn.net/files/2640/458/jei_1.12.2-4.13.1.225.jar

# add new slots for accesories
RUN wget https://media.forgecdn.net/files/2518/667/Baubles-1.12-1.5.2.jar
# control death penalty
#RUN wget https://media.forgecdn.net/files/2672/212/corpsecomplex-1.12.2-1.0.4.1.jar
# generate a grave stone when player death.
RUN wget https://media.forgecdn.net/files/2634/989/GraveStone-1.12.2-Graves-1.3.1.jar
# add trinkets and baubles for Baubles mod
RUN wget https://media.forgecdn.net/files/2666/572/Trinkets-and-Baubles-1.12.2-0.22.jar
# railstuff
RUN wget https://media.forgecdn.net/files/2668/333/railstuff-0.0.1.jar
# this is a sever side mod
RUN wget https://media.forgecdn.net/files/2620/81/%5b1.12.x%5d%5bver.3.0.0%5dSpawnController.jar.jar

# download resources pack
WORKDIR /start/config/immersiverailroading

#RUN wget -O heavy_industrial.zip https://media.forgecdn.net/files/2580/642/Heavy%2BIndustrial%2B1.4.2.1%2Bby%2Badam%2Br%2Bk.zip
RUN wget -O Amtrak.zip https://media.forgecdn.net/files/2603/398/Amtrak%2B.zip
RUN wget -O American_Freight_Pack.zip https://media.forgecdn.net/files/2661/528/American+Freight+Pack.zip
RUN wget -O American_Diesel_Locomotive_Pack.zip https://media.forgecdn.net/files/2667/79/American+Diesel+Locomotive+Pack.zip
RUN wget -O American_Passenger_Pack.zip https://media.forgecdn.net/files/2667/850/American+Passenger+Pack.zip
#RUN wget https://media.forgecdn.net/files/2624/834/AmericanPassengerPack_beta0.3.zip
RUN wget https://media.forgecdn.net/files/2667/447/SantaFe_Railroadpack0.4.zip
RUN wget -O Japanese_Electric_Locomotive.zip https://media.forgecdn.net/files/2610/625/Japanese+Electric+Locomotive+Pack.zip
RUN wget https://media.forgecdn.net/files/2637/533/ThemePark_1.4.zip
# RUN wget https://media.forgecdn.net/files/2629/353/friedrichlps-modern-stock-1.12.zip

# copy repo files to root folder
WORKDIR /start

RUN cp Amtrak.zip\
    American_Freight_Pack.zip\
    American_Diesel_Locomotive_Pack.zip\
    American_Passenger_Pack.zip\
    SantaFe_Railroadpack0.4.zip\
    Japanese_Electric_Locomotive.zip\
    ThemePark_1.4.zip\
    /start/resourcepacks/

COPY server.properties\
     eula.txt\
     startup.py\
     __init__.py\
     forge-1.12.2-14.23.5.2768-universal.jar\
     minecraft_server.1.12.2.jar\
     ./
COPY oc_message_broker/ /start/oc_message_broker/

COPY libraries/ /start/libraries/
COPY config/ /start/config/
COPY scripts/ /start/scripts/
COPY mods/ /start/mods/

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
