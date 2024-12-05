## Ip Address

_An ip address is an unique assigned to device connected to a network. It allows devices to connect with each other over the internet or other network._

```bash
ssh username@ipAddress -p port
```

## SSH Steps

- _First check if we can ping to the source ip before shh it_

```bash
 ping ipAddress
```

- _Check firewall restriction_

```bash
sudo ufw status
```

- _If the ssh is not running run it._

```bash
sudo ufw allow ssh
```

- _Check if the network interface active._

```bash
sudo ip link show
```

- _Check the route._

```bash
ip route
```

- _Check SSH status._

```bash
sudo systemctl status ssh
```
