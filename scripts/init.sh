#!/bin/bash
waitforvideo() {
	while [[ "${hevc[1]}" == "ON" ]]; do
		sleep 1;
		hevc=($(st pmu show | grep hevc)); 
	done
}
hevc=($(st pmu show | grep hevc)); 
if [[ "${hevc[1]}" == "ON" ]]; then 
	/opt/usr/nx-ks/popup_timeout  "WARNING: NOT Loading in Video Mode !" 5
	waitforvideo
fi
export HIB=a
export EVAS_FONT_DPI=72
export EINA_LOG_LEVELS=ecore_x:4,evas_main:1
export HISTSIZE=1000
export GTK_IM_MODULE_FILE=/opt/etc/gtk-2.0/gtk.immodules
export LD_LIBRARY_PATH=:/usr/lib:/usr/lib/driver
export ECORE_IMF_MODULE=isf
export ECORE_INPUT_TIMEOUT_FIX=0
export PATH="/usr/share/scripts:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/usr/devel/usr/sbin:/opt/usr/devel/usr/bin:/opt/usr/devel/sbin:/opt/usr/devel/bin:/opt/usr/nx-ks"
export EINA_LOG_DLOG_ENABLE=1
export XMODIFIERS=@im=SCIM
export EINA_LOG_LEVEL=1
export SCIM_MODULE_PATH=/opt/apps/scim/lib/scim-1.0
export ECORE_INPUT_FIX=1
export XDG_CACHE_HOME=/tmp/.cache
export EVAS_GL_NO_BLACKLIST=1
export DISPLAY=:0
export GTK_IM_MODULE=scim
export EINA_LOG_SYSLOG_ENABLE=0
export ELM_PROFILE=mobile
export SHELL="/bin/sh"
export SHLVL="2"
export TERM="vt102"
export USER="root"
export LOGNAME="root"
export MULTISENSE_SND_PLAYER="tizen_snd_player"
nice -n +15 /opt/usr/nx-ks/keyscan /dev/event0 /dev/event1 /opt/usr/nx-ks/ &
sync
sync
sync
