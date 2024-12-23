## UFW (Uncomplicated Firewall)

_UFW is the default firewall tool for many Linux distributions, including Ubuntu._

## Commands

- **Enable UFW**

```bash
sudo ufw enable
```

- **Disable UFW**

```bash
sudo ufw disable
```

- **Check UFW status**

```bash
sudo ufw status
sudo ufw status verbose
```

- **Allow or deny Rules**

```bash
sudo ufw allow 22
sudo ufw allow ssh
```

- **Allow a port range (e.g., ports 1000-2000):**

```bash
sudo ufw allow 1000:2000/tcp
```

- _*Allow traffic from a specific ip*_

```bash
sudo ufw allow from 192.186.100.8
```

- **Deny a specific route or ip**

```bash
sudo ufw deny 90
sudo ufw deny http
```

- _*Remove a rule*_

```bash
sudo ufw delete allow 22
sudo ufw delete deny 22
```

### Advance Rules

- **Allow traffic from a specific subnet**

```bash
sudo ufw allow from 192.168.100.0/24
```

- **Allow traffic from or to a specific route**

```bash
sudo ufw allow from 192.168.100.8 to any port 22
```

## IPTABLES

_`iptables` is a more advanced and flexible firewall tool used in many Linux distributions._

## Commands

- **Check iptables rules**

```bash
sudo iptables -L
sudo iptables -L -v -n
```

- **Flush all rules**

```bash
sudo iptables -F
```

- **Allow incoming ssh on port 22**

```bash
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
```

- **Block a specific IP**

```bash
sudo iptables -A INPUT -s 192.168.100.9 -j DROP
```

- **Accept a rule**

```bash
sudo iptables -A INPUT -s 192.168.100.9 -j ACCEPT
```

- **Delete the specific rule by line number**

```bash
sudo iptables -L --line-numbers
sudo iptables -D INPUT <line-number>
```

- **Delete a specific route by matching it**

```bash
sudo iptables -D INPUT -p tcp --dport 22 -j ACCEPT
```

- **Save rules**

```bash
sudo iptables-save > /etc/iptables/rules.v4
```

- **Reload Rules**

```bash
sudo iptables-restore < /etc/iptables/rules.v4

```
