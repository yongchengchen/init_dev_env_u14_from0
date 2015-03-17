FULLPATH = ${PWD}

# 1. update rubygems
cd $FULLPATH
tar -vxf rubygems-2.4.6.tgz
cd $FULLPATH/rubygems-2.4.6/
sudo ruby setup.rb
sudo gem update --system

# 2. install rails
sudo apt-get install ruby-full
sudo apt-get install zlib1g-dev
sudo gem install rails

# 3. install nodejs
sudo apt-get install nodejs

# 4. optional install sqlite3
sudo gem install sqlite3 -v '1.3.10'
