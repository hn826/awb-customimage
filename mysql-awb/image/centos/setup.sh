#/bin/bash

while [ `sudo systemctl status mysqld | echo $?` -ne 0 ]; do echo "Waiting for MySQL Server Running."; sleep 1; done

sudo cat << 'EOF' | mysql -uroot -p`grep 'temporary password' /var/log/mysqld.log | tail -n1 | awk -F' ' '{print $NF}'` --connect-expired-password
SET PASSWORD = PASSWORD('P@ssw0rd');
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'P@ssw0rd' WITH GRANT OPTION;
GRANT PROXY ON ''@'' TO 'root'@'%' WITH GRANT OPTION;
EOF
