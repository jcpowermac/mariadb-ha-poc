#!/bin/bash

PASSWORD="uJxfabAUBcWK"

mysql -h galera.galera.svc -u user -D userdb -p"${PASSWORD}" -e 'CREATE TABLE example_timestamp (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,data VARCHAR(100),cur_timestamp TIMESTAMP(6));'

for run in {1..50}
do
      mysql -h galera.galera.svc -u user -D userdb -p"${PASSWORD}" -e 'INSERT INTO example_timestamp (data) VALUES ("The time of creation is:");'
done


echo "##### Using Service #####"
mysql -h galera.galera.svc -u user -D userdb -p"${PASSWORD}" -e 'select * from example_timestamp;'

echo "##### Using mariadb-galera-0 #####"
mysql -h mariadb-galera-0.galera.galera.svc.cluster.local -u user -D userdb -p"${PASSWORD}" -e 'select * from example_timestamp;'

echo "##### Using mariadb-galera-1 #####"
mysql -h mariadb-galera-1.galera.galera.svc.cluster.local -u user -D userdb -p"${PASSWORD}" -e 'select * from example_timestamp;'

echo "##### Using mariadb-galera-2 #####"
mysql -h mariadb-galera-2.galera.galera.svc.cluster.local -u user -D userdb -p"${PASSWORD}" -e 'select * from example_timestamp;'

