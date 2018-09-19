Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
   config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  $script = <<-SCRIPT
  # Install Puppet and RubyGem
  rpm -Uvh https://yum.puppet.com/puppet5/puppet5-release-el-7.noarch.rpm
  yum --nogpgcheck -y install puppet-agent rubygems git

  # Reload environment variables
  source ~/.bashrc

  # Install librarian and the Puppet modules
  gem install --no-rdoc --no-ri bundler
  cd /vagrant

  /usr/local/bin/bundle install 
  /usr/local/bin/r10k puppetfile install
  SCRIPT

  config.vm.provision "shell", inline: $script 

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file = "init.pp"
    puppet.options = "--verbose"
  end

  config.vm.provision "shell", path: "start.sh", run: 'always' 

end
