#!/bin/sh 
your_gid=`id -g`
if [ $your_gid -eq 20000 ]
then 
    echo 'You are a student.'
elif [ $your_gid -eq 20090 ]
then 
    echo 'You are a TA.'
else
    : # do nothing
fi