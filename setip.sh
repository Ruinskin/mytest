 if [ $? -ne 0 ];then
  echo 'Network Address Error'
 fi
 nmcli connection up $name
 confip
else
 nmcli connection modify $name ipv4.method manual ipv4.addresses $ip ipv4.gateway $gw connection.autoconnect yes &> /dev/null
 if [ $? -ne 0 ];then
  echo 'Network Address Error'
 fi
 nmcli connection up $name
 confip
fi
}
read  -p  'Network name(eth0/eth1/eth2/eth3):'  name
read  -p  'Set IP(IP/24):'  ip
read  -p  'Set Gateway(default none):'  gw
if [ -z $name ] || [ -z $ip ];then
 echo -e "\e[31;1mPlease enter parameters\e[0m"
 exit
fi
echo $ip | grep /24
if [ $? -ne 0 ];then
  echo -e "\e[31;1mNetwork Address Error\e[0m"
  exit
fi
 
case $name in
   eth0)
   network;;
   eth1)
   network;;
   eth2)
   network;;
   eth3)
   network;;
   *)
   echo -e "\e[31;1mNetwork Address Error\e[0m"
esac
