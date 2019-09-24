#!/bin/bash

docker-compose up -d z0.foo.org z1.foo.org z2.foo.org
sleep 3

docker-compose up -d k0.foo.org k1.foo.org k2.foo.org k3.foo.org
sleep 3

docker-compose up -d o0.foo.org o1.foo.org
sleep 3

docker-compose up -d db.p1.ijk.com
docker-compose up -d p0.abc.com p1.abc.com p0.xyz.com p1.xyz.com p0.ijk.com p1.ijk.com 
docker-compose up -d admin.abc.com admin.xyz.com admin.ijk.com
docker-compose up -d hello.bank
sleep 3
