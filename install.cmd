FULLPATH=${PWD}

#for disable 3D UI 
sudo apt-get install gnome-session-fallback

#install tools
sudo apt-get update
sudo apt-get install git
sudo apt-get install vim
sudo apt-get install rake

sudo apt-get install nginx
sudo apt-get install redis-server
sudo apt-get install mysql-server

#install php5,and remove apache2 from php5 installation
sudo apt-get install php5
sudo apt-get remove apache2


#install php libraries
sudo apt-get install php5-curl
sudo apt-get install php5-gd
sudo apt-get install php5-mysql
sudo apt-get install php5-mcrypt

sudo apt-get install postfix



#install fastcgi 
# https://www.linode.com/docs/websites/nginx/nginx-and-phpfastcgi-on-debian-6-squeeze
sudo apt-get install php5-cli php5-fpm
sudo apt-get install spawn-fcgi
sudo cp -a ${FULLPATH}/php-fastcgi.x /usr/bin/php-fastcgi
sudo chmod +x /usr/bin/php-fastcgi

sudo cp -a ${FULLPATH}/php-fastcgi.inid /etc/init.d/php-fastcgi
sudo chmod +x /etc/init.d/php-fastcgi
sudo update-rc.d php-fastcgi defaults
sudo service php-fastcgi start




#config nginx website
sudo cp -a ${FULLPATH}/website.nginx.conf /etc/nginx/sites-available/website
sudo ln -s /etc/nginx/sites-available/website /etc/nginx/sites-enabled/website
cp -a ${FULLPATH}/nginx.conf /etc/nginx/nginx.conf
sudo mkdir /var/log/nginx/access_logs/
sudo mkdir /var/log/nginx/error_logs/


#install xdebug
sudo apt-get install php5-xdebug

sudo echo "[Xdebug]
;;xdebug.auto_trace = On
;;xdebug.show_exception_trace = On
xdebug.remote_autostart = On
xdebug.remote_enable = On
;;xdebug.collect_vars = On
xdebug.collect_return = On
xdebug.collect_params = On
xdebug.remote_handler=dbgp
xdebug.remote_host=127.0.0.1
xdebug.remote_mode=req
xdebug.idekey=default
xdebug.show_exception_trace=0
xdebug.show_local_vars=9
xdebug.show_mem_delta=0
xdebug.trace_format=0
xdebug.max_nesting_level = 400
xdebug.remote_port = 9000
" >> /etc/php5/cgi/conf.d/20-xdebug.ini

sudo service php-fastcgi restart
sudo service php-fastcgi restart

#install vim xdebugger client
# https://mutelight.org/minimal-guide-to-debugging-php-with-xdebug-and-vim
# http://www.vim.org/scripts/script.php?script_id=2508
mkdir ~/.vim
mkdir ~/.vim/plugin/
cp -a ${FULLPATH}/vim-xdebugger/debugger.*  ~/.vim/plugin/

#last step checkout your website

