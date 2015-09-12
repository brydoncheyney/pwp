# pwp
playtime with provisioning

- vagrant
- lxc
- ansible
- capistrano

## dependencies

lxc container names are managed by dnsmasq. To enable dns hostname access to
containers, add the following to /etc/resolvconf/resolv.conf.d/head on the host

    nameserver 10.0.3.1

to update /etc/resolv.conf, run

    $ sudo resolvconf -u
