El objetivo es que el trafico a algún puerto
especifico (usado por una aplicación que no soporta HTTP_PROXY) sea
redirigido vía `iptables` a un `redsocks` que lleve al mismo proxy que hay en
[HTTP_PROXY](https://docs.docker.com/config/daemon/systemd/).

El ejemplo original ([medium.com/datadriveninvestor](https://medium.com/datadriveninvestor/how-to-transparently-use-a-proxy-with-any-application-docker-using-iptables-and-redsocks-b8301ddc4e1e))
se usa para curl + ftp (puerto 21) y los valores del proxy se obtienen por parámetro,
no de HTTP_PROXY.

En este proyecto a parte de si obtener los datos del proxy vía HTTP_PROXY se ha
sustituido el ejemplo de curl + ftp por uno con python + psycopg2 (puerto 5432).
