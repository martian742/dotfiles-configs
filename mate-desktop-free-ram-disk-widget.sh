#!/bin/bash
{ echo RAM:;echo $(free -h |grep Mem |awk {'print $4'}); echo DISK:; echo $(df -h |grep /dev/vda |awk {'print $4'}); echo \ \ VPN:; echo $(/opt/MotionPro/MotionPro.sh --status|awk {'print $3'}); } | tr "\n" " "
