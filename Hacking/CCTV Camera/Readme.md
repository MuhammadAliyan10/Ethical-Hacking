## How to hack any CCTV camera with basic level of security

_To hack any cctv camera you need to have some basic information about how its work. Many tools are used to hack the camera as we go through step by step._

### Tools and Working

_We are using `arp` to do the task._

```bash
sudo arp-scan --interface wlan0 -l
```

_In this command `arp-scan` is used to scan the interface and `wlan0` is the network interface we are connected to so if you want to check try_

```bash
ifconfig
```

_After than we got the name of the devices that are connected to that network so check on google to know more about the device._

#### Port

_Now we need to check if there is any port open so we can check active service running on that port. We are using `nmap` for this task._

```bash
namp 10.0.0.12
```

_This will provide all ports so I recommend you to study all ports for extra information._

_There are two more used ports one is tcp and other is RTSP(`Realtime streaming protocol`). We can access tcp on web and RTCP on VLC media player._

### Warning this is only for ethical use.
