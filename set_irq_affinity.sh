#!/system/bin/sh

# This script sets the default affinity to the processors with the given part id.
#   - part id is in hex (as seen in /proc/cpuinfo)

function build_mask_from_part_id {
    local IFS
    local mask
    local ref_part_id

    ref_part_id=$1
    IFS=$'\n'

    for line in `cat /proc/cpuinfo`
    do
        IFS=':'
        set -A tokens $line

        if [ "${line#'processor'}" != "$line" ]
        then
            cpu="${tokens[1]##' '}"
        elif [ "${line#'CPU part'}" != "$line" ]
        then
            part_id="${tokens[1]##' '}"

            if [ "$part_id" == "$ref_part_id" ]
            then
                (( mask |= 1 << $cpu ))
            fi
        fi
    done
    echo $(printf "%x" $mask)
}

ref_part_id=$(echo $1 | tr '[A-Z]' '[a-z]')
mask=$(build_mask_from_part_id $ref_part_id)
[ -z "$mask" ] && exit

echo $mask > /proc/irq/default_smp_affinity

for i in `ls /proc/irq`
do
    affinity_file="/proc/irq/$i/smp_affinity"
    [ -e $affinity_file ] && echo $mask > $affinity_file
done
