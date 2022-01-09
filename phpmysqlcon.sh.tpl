#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
sudo yum install -y httpd mariadb-server
sudo systemctl start httpd
sudo systemctl enable httpd
sudo usermod -a -G apache ec2-user
sudo chown -R ec2-user:apache /var/www
sudo chmod 2775 /var/www
cd /var/www/html
sudo yum update -y
sudo yum install git -y
sudo git clone https://github.com/NagarajanSuresh/sample_php_app.git ./
sudo mysql -h ${rds_dns} -P 3306 -u ${db_username} --password=${db_password} < "initsql.sql"
sudo echo "${rds_dns}" > host.txt