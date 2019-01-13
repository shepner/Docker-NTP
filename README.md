# Docker-[openntpd](http://www.openntpd.org)

To run in Docker swarm:
``` shell
sudo docker service create \
  --name OpenNTPD \
  --publish published=123,target=123,protocol=udp,mode=ingress \
  --constraint node.role!=manager \
  --replicas=2 \
  shepner/openntpd:latest
  ```
  
The NTP clients should point at all the Docker swarm nodes:
```
server 10.0.0.71
server 10.0.0.72
server 10.0.0.73
server 10.0.0.74
server 10.0.0.75
server 10.0.0.76
```
