 #!/bin/bash
set +x
VPNInterfaces=$(nmcli -t -f DEVICE,TYPE device | grep tun | cut -f1 -d ":")
VPNCount=$(echo "$VPNInterfaces" | wc -l)
if [ "$VPNCount" -eq 1 ]; then
    Percentage=50
else
    Percentage=100
fi
# Check if any VPN interfaces are active
if [ -z "$VPNInterfaces" ]; then
    # No VPN connected
    echo '{"display":"󰿇","class":"disconnected","percentage":0}'
else
    for VPNInterface in $VPNInterfaces; do
    # Get the IP address of the VPN interface
    CleanedInterface=$(echo "$VPNInterface" | sed 's/^ovpn-//')
    VPN_IP=$(nmcli -t -f IP4.ADDRESS device show "$VPNInterface" | cut -f2 -d :)
    
    # Append the interface name and IP address to the tooltip
    tooltip+="$CleanedInterface | $VPN_IP\n"
    done
    tooltip=$(echo -e "$tooltip" | sed '$ s/\\n$//')
    # VPN(s) connected
    # Gather the names of active VPN interfaces
    ActiveVPNs=$(echo "$VPNInterfaces" | paste -sd, -)
    #echo "{\"text\":\"$ActiveVPNs\",\"tooltip\":\"$tooltip\",\"class\":\"connected\",\"percentage\":$Percentage}"
    printf '{"text":"%s","tooltip-disable":"%s","class":"connected","percentage":%s}\n' "$ActiveVPNs" "$tooltip" "$Percentage"
    #echo "{\"text\":\"$ActiveVPNs\",\"tooltip\":"",\"class\":\"connected\",\"percentage\":$Percentage}"
fi
