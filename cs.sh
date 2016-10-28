#!/bin/sh

if [ ! -d $HOME/Applications/Steam.app ] || [ ! -d /Applications/Steam.app ] ; then 
	curl -O -o $HOME/Downloads https://steamcdn-a.akamaihd.net/client/installer/steam.dmg
	open $HOME/Downloads/steam.dmg
	echo "Aceite os termos licenca do Steam antes de continuar"
	echo "Em seguida tecle [ENTER]"
	read qq
	cp -pr /Volumes/Steam/Steam.app $HOME/Applications/
	open $HOME/Applications/Steam.app
fi

ps ax | grep -i steam |awk '{print "kill -9 " $1}' |sh

if [ ! -d "$HOME/Library/Application Support/Steam/steamapps/common" ] ; then
	mkdir $HOME/Library/Application\ Support/Steam/steamapps/common
fi

rmdir $HOME/Library/Application\ Support/Steam/steamapps/downloading/*
curl -O -o $HOME/Library/Application\ Support/Steam/steamapps https://main.bh.freebsdbrasil.com.br/~urisso/appmanifest_730.acf
curl -O -o $HOME/Library/Application\ Support/Steam/steamapps https://main.bh.freebsdbrasil.com.br/~urisso/appmanifest_70.acf
curl -O -o $HOME/Library/Application\ Support/Steam/steamapps https://main.bh.freebsdbrasil.com.br/~urisso/appmanifest_10.acf

curl -O -o $HOME/Library/Application\ Support/Steam/steamapps/common https://main.bh.freebsdbrasil.com.br/~urisso/csgo.tar
curl -O -o $HOME/Library/Application\ Support/Steam/steamapps/common https://main.bh.freebsdbrasil.com.br/~urisso/cs16.tar

tar -zxv -C $HOME/Library/Application\ Support/Steam/steamapps/common -f csgo.tar
tar -zxv -C $HOME/Library/Application\ Support/Steam/steamapps/common -f cs16.tar

rm $HOME/Library/Application\ Support/Steam/steamapps/common/*.tar

$HOME/Library/Application\ Support/Steam/Steam.AppBundle/Steam/Contents/MacOS/steam_osx >/dev/null 2>&1 &
