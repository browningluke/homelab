# Wireguard on a VPS to bypass CGNAT

With this setup I can access my internal network (10.8.0.0/24) through a Wireguard tunnel hosted on a VPS, bypassing my ISP's CGNAT. 

I use a pfSense router as the entrypoint in my LAN network and a Oracle free-tier E2.1 Micro instance as the common Wireguard client.

This setup follows the wonderful guide put together by [insdavm](https://github.com/insdavm) which can be found [here](https://gist.github.com/insdavm/b1034635ab23b8839bf957aa406b5e39). The only modification I made was to change `ens3` to `eth0` in the VPS conf file.


Below is a copy of insdavm's guide for archival purposes. (as of 2021-03-13)

---

# WireGuard Site-to-Site

*Accessing a subnet that is behind a WireGuard client using a site-to-site setup*

#### Problem Summary

We want to access a local subnet remotely, but it is behind a NAT firewall and we can't setup port forwarding.  Outgoing connections work, but all incoming connections get DROPPED by the ISP's routing policy.

#### Solution Summary

We'll create a site-to-site connection with **WireGuard** allowing us to access the local subnet on a remote device (smartphone, in this example) by connecting through a cloud server in the middle.

## Working Example

First let's define our three hosts.  They all have **WireGuard** installed.

```A```  the Linux machine on the *local subnet*, **behind the NAT/firewall**  
```B```  the Linux cloud server (*VPS, like an Amazon EC2 instance*)  
```C```  a third **WireGuard** client; a smartphone in this example  

#### Host 'A'

The Host A's ```/etc/wireguard/wg0-client.conf```:

```conf
[Interface]
Address = 10.200.200.5/24                  
PrivateKey = <HOST 'A' PRIVATE-KEY>
ListenPort = 27836                         # optional; will be randomly assigned otherwise
DNS = 1.1.1.1                              # or your own DNS server if you're running one    

[Peer]
PublicKey = <PUBLIC KEY OF HOST 'B'>
Endpoint = host-b-fqdn.tld:51820
AllowedIPs = 0.0.0.0/0, ::/0

PersistentKeepalive = 25                   # to keep connections alive across NAT
```

Here's what we need to add to Host A's ```iptables``` rules, *expressed as the commands you would use to ADD them*:

```
# iptables -A FORWARD -i wg0-client -j ACCEPT
# iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
```

Finally, we need to make sure IP forwarding is enabled in Host A's kernel:

```
$ sysctl net.ipv4.ip_forward=1
```

#### Host 'B'

Host B's ```/etc/wireguard/wg0.conf```:

```conf
[Interface]
Address = 10.200.200.1/24
PrivateKey = <HOST 'B' PRIVATE KEY>
ListenPort = 51820

PostUp = iptables -A FORWARD -i %i -j ACCEPT; iptables -t nat -A POSTROUTING -o ens3 -j MASQUERADE
PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -t nat -D POSTROUTING -o ens3 -j MASQUERADE


# This is the peer that is on the private subnet that we want to access.
#
# Notice the AllowedIPs... without this part, WireGuard will drop the 
# packets destined for the HOST 'A' subnet.  AllowedIPs is acting like
# a routing table and ACL here.

[Peer]
PublicKey = <HOST 'A' PUBLIC KEY>
AllowedIPs = 10.200.200.5/32, 100.10.202.0/24

# The smartphone
[Peer]
PublicKey = <HOST 'C' PUBLIC KEY>
AllowedIPs = 10.200.200.3/32

# An additional peer...
[Peer]
PublicKey = <Additional peer pubkey>
AllowedIPs = 10.200.200.4/32
```

Like we did with Host A, IP forwarding must also be enabled on Host B:

```
$ sysctl net.ipv4.ip_forward=1
```

#### Host C

Host C's configuration file:

```conf
[Interface]
PrivateKey = <HOST 'C' PRIVATE KEY>
Address = 10.200.200.3/24
DNS = 1.1.1.1


[Peer]
PublicKey = <HOST 'B' PUBLIC KEY>
AllowedIPs = 0.0.0.0/0
Endpoint = host-b-fqdn.tld:51820
PersistentKeepalive = 25
```

**You're finished.**  
Make sure **WireGuard** is running on both HOSTS A and B, and then on the smartphone (HOST C), after connecting to HOST B with **WireGuard** you should be able to ping ```10.200.200.5```.
