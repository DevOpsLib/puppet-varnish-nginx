# Using a SystemD image because most of the Puppets services manifests need the systemd to monitor the service.
FROM centos/systemd
MAINTAINER Pedro César "pedrocesar.ti@gmail.com"

ENV PATH="/opt/puppetlabs/bin/:${PATH}"

RUN rpm -Uvh https://yum.puppet.com/puppet5/puppet5-release-el-7.noarch.rpm\
  && yum --nogpgcheck -y install puppet-agent rubygems git\
  && gem install --no-rdoc --no-ri bundler

COPY Gemfile Puppetfile ./ 

RUN bundle install
RUN r10k puppetfile install

COPY manifests ./manifests
RUN puppet apply manifests/init.pp 

EXPOSE 80

COPY start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT [ "bash", "-c" ] 
CMD [ "/start.sh" ]
