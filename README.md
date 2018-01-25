# mariadb-ha-poc


#### run

```
oc new-project galera
oc create -f https://raw.githubusercontent.com/jcpowermac/mariadb-ha-poc/master/mariadb-galera-ephemeral-template.yml
oc new-app --template mariadb-galera-ephemeral
```

Start a container to execute `mysql` commands.  NOTE: when using `oc cluster up` I had to replace registry
url with IP address.

```
oc run galera --restart=Never --image=docker-registry.default.svc:5000/galera/mariadb-galera --attach=true -it -- bash

mysql -h galera.galera.svc -u root -p
```

#### Resources:
- https://github.com/dome/k8s-mariadb-cluster/tree/master/example
- https://github.com/raffaelespazzoli/containers-quickstarts/blob/mariadb-ha/mariadb-ha/Dockerfile
- https://github.com/adfinis-sygroup/openshift-mariadb-galera
- https://github.com/sclorg/mariadb-container/tree/master/10.2
