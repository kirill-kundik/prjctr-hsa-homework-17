# PRJCTR Homework 17: DDoS attack

In this task two containers have to be set up: one 
with a simple nginx web server and another one 
has to attack nginx with 6 attacks (UDP flood, 
ICMP flood, HTTP flood, Slowloris, SYN flood,
Ping of Death). nginx should implement several protection
methods to overcome attack.

## Prerequisites

Installed [Docker](https://www.docker.com/get-started/).

## Overview

To start the stack execute following command:

```bash
docker-compose up -d
```

This will up nginx and attacker containers, 
and start different kind of attacks immediately.

All required kind of attacks were implemented in 
the attacker container with [hping3](https://www.kali.org/tools/hping3/),
[siege](https://github.com/JoeDog/siege), and
[slowloris](https://github.com/gkbrk/slowloris) libs.

Defender container is protected with just 
[http_limit_req_module](http://nginx.org/en/docs/http/ngx_http_limit_req_module.html).
Also, the default firewall settings for the container 
protects it from UDP flood attack.

## Results

The nginx container successfully overcome the attack. 
However, average response time with a single HTML page 
was increased drastically from `6.5ms` to `470ms` and 
maximum response time increased from `11ms` to `1500ms`.
But nginx successfully continued to satisfy all requests, 
and it wasn't down.
