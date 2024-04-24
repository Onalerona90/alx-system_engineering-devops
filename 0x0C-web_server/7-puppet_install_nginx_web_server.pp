# Install Nginx web server (w/ Puppet)
exec { 'config_server':
  provider => shell,
  command  => 'sudo apt-get update; sudo apt-get -y install nginx; echo "Hello World!" | sudo tee /var/www/html/index.html; redirection_string="server_name _;\n\trewrite ^\/redirect_me https:\/\/onaleronapako.tech permanent;"; sudo sed -i "s/server_name _;/$redirection_string/" /etc/nginx/sites-available/default; sudo nginx -t; sudo service nginx restart',
}
