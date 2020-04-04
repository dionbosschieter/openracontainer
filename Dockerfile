FROM mono:latest

RUN apt update
RUN apt install -y mono-devel mono-complete libfreetype6 libopenal1 liblua5.1-0 libsdl2-2.0-0 xdg-utils zenity wget git unzip make python

RUN useradd -ms /bin/bash openra
RUN mkdir /app /.config && chown -v openra /app /.config

USER openra
RUN git clone https://github.com/openra/openra /app
RUN cd /app && git checkout release-20200202 && make dependencies && VERSION=release-20200202 make version && make all

CMD [ "./launch-game.sh", "Game.Mod=ts" ]
