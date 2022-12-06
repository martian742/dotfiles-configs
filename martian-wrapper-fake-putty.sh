#!/bin/bash

#This wrapper parses credentials sent to a putty command and feeds them to a Gnome/Mate-terminal session with ssh inside.

USAGE="Usage: $0 -pw {PASSWORD} -l {USERNAME} {IP_ADDRESS}"

if [ "$#" == "0" ]; then
	echo "$USAGE"
	exit 1
fi

echo $@

IP_ADDRESS=${!#}

for i in $@
do
case $i in
    -pw)
        #echo $2
        PASSWORD="$2"
        ;;
    -l)
	    #echo $2
	    USERNAME="$2"
	    ;;
	# ip address-pretenders
#	*[!.0-9]* | *.*.*.*.* | .* | *. | *[0-9][0-9][0-9][0-9]* | *2[6-9][0-9]* | *25[6-9]* )
#        :
#        ;;
    # valid ip addresses
#    *.*.*.* )
        #echo $1
#	    IP_ADDRESS="$1"
#	    ;;
    *)
        # unknown option
        ;;
esac
shift  #moving on
done

[ -z "$PASSWORD" ] && echo "password not defined" && exit 1
[ -z "$USERNAME" ] && echo "username not defined" && exit 1
#[ -z "$IP_ADDRESS" ] && echo "IP address not defined" && exit 1

#echo "sshpass -p $PASSWORD ssh $USERNAME@$IP_ADDRESS"
mate-terminal --command "sshpass -p $PASSWORD ssh $USERNAME@$IP_ADDRESS"
