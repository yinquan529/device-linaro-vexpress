#!/system/bin/sh

if grep -q -e FVT -e RTSM /proc/device-tree/model
then
	# We're running on a fast model so speed things up by...
	setprop debug.sf.nobootanimation 1
fi

if grep -q -e V2P-CA15_CA7 /proc/device-tree/model
then
	# We're running on TC2, set some HMP scheduler tunables...

	echo 0 > /sys/kernel/hmp/packing_enable

	# TC2 has a sharp consumption curve @ around 800Mhz, so
	# we aim to spread the load around that frequency.
	# '650' is  80% of the 800Mhz freq * NICE_0_LOAD
	echo 650 > /sys/kernel/hmp/packing_limit
fi
