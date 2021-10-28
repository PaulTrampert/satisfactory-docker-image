FROM cm2network/steamcmd

ENV STEAMAPPID 1690800
ENV STEAMAPP Satisfactory
ENV STEAMAPPDIR "${HOMEDIR}/${STEAMAPP}-dedicated"

RUN ${HOMEDIR}/steamcmd/steamcmd.sh +login anonymous +force_install_dir ${STEAMAPPDIR} +app_update ${STEAMAPPID} +quit
RUN mkdir -p ${HOMEDIR}/.config/Epic/FactoryGame/Saved/
ENV PATH ${PATH}:${STEAMAPPDIR}
VOLUME ["${HOMEDIR}/.config/Epic/FactoryGame/Saved/"]

EXPOSE 15777/udp
EXPOSE 15000/udp
EXPOSE 7777/udp

CMD [ "FactoryServer.sh" ]