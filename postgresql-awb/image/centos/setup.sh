#/bin/bash

sudo postgresql-setup initdb
sudo sed -i 's@127.0.0.1/32@0.0.0.0/0   @' /var/lib/pgsql/data/pg_hba.conf
sudo sed -i 's@ident@trust@' /var/lib/pgsql/data/pg_hba.conf
sudo echo "listen_addresses='*'" >> /var/lib/pgsql/data/postgresql.conf
sudo systemctl restart postgresql
