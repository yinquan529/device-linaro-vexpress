#!/system/bin/sh

if grep -q -e FVT -e RTSM /proc/device-tree/model
then
	# We're running on a fast model so speed things up by...
	setprop debug.sf.nobootanimation 1
fi
