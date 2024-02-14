#!/bin/bash
for arg in "$@"
do
    if [ "$arg" == "--help" ] || [ "$arg" == "-h" ]
    then
        echo "--ip IP Address to rsync Indicator files to"
    else
        sshpass -p "atestind123" \
        rsync -azv - e "ssh -i ~/.ssh/myopenssh.ppk" \
        --exclude=.git* \
        --exclude=env* \
        --exclude=*.pyc \
        --exclude=*__pycache__* \
        --exclude=run* \
        --exclude=*/datatables/* \
        --exclude=build* \
        --exclude=dist* \
        ./webapp/ \
        pi@"$arg":/home/pi/bin/scale/Scale/
    fi
done