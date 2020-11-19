sudo apt update
sudo apt install apache2
sudo systemctl enable apache2
sudo systemctl start apache2
cat >> /var/www/html/index.html << EOF
<html>
<head>
  <title> Ubuntu rocks! </title>
</head>
<body>
  <p> Site is running on tomcat host which is running in private subnet!
</body>
</html>
EOF