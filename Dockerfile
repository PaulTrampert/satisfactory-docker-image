FROM cm2network/steamcmd

ARG RELEASE_BRANCH=public

ENV STEAMAPPID 1690800
ENV STEAMAPP Satisfactory
ENV STEAMAPPDIR "${HOMEDIR}/${STEAMAPP}-dedicated"

RUN ${HOMEDIR}/steamcmd/steamcmd.sh +force_install_dir ${STEAMAPPDIR} +login anonymous +app_update ${STEAMAPPID} -beta ${RELEASE_BRANCH} validate +quit
RUN mkdir -p ${HOMEDIR}/.config/Epic/FactoryGame/Saved/
ENV PATH ${PATH}:${STEAMAPPDIR}
VOLUME ["${HOMEDIR}/.config/Epic/FactoryGame/Saved/"]

EXPOSE 15777/udp
EXPOSE 15000/udp
EXPOSE 7777/udp

CMD [ "FactoryServer.sh" ]