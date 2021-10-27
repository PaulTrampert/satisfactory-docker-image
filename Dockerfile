FROM steamcmd/steamcmd

RUN adduser --disabled-login satisfactory --home /home/satisfactory
USER satisfactory
ENV HOME /home/satisfactory
WORKDIR /home/satisfactory
RUN steamcmd +login anonymous +force_install_dir SatisfactoryDedicatedServer +app_update 1690800 +quit
RUN mkdir -p /home/satisfactory/.config/Epic/FactoryGame/Saved/
VOLUME ["/home/satisfactory/.config/Epic/FactoryGame/Saved/"]

EXPOSE 15777/udp
EXPOSE 15000/udp
EXPOSE 7777/udp

ENTRYPOINT [ "./.steam/steamcmd/SatisfactoryDedicatedServer/FactoryServer.sh" ]