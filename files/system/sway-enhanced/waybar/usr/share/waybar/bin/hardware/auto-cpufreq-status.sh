#!/bin/sh

governor=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)

output=""
case $governor in
    "performance")
        #output=""
        output="󱡮"
        ;;
    "balance_power")
        output=""
        ;;
        
    "powersave")
        output=""
        ;;
    *)
        :
        ;;
esac

echo "${output}\ngovernor: ${governor}\nnormal"

