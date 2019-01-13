# Docker-[openntpd](http://www.openntpd.org)

``` shell
sudo docker service create \
  --name OpenNTPD \
  --publish published=123,target=123,protocol=udp,mode=ingress \
  --replicas=1 \
  shepner/openntpd:latest
  ```
  
