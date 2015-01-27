FROM kingdonb/baseimage:latest
MAINTAINER Kingdon <kbarrett@metrixmatrix.com>
ADD app /app
RUN apt-get install -y curl
ENV HOME /root
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
RUN \curl -sSL https://get.rvm.io | bash -s stable --ruby
WORKDIR /app
RUN bash -l -c bundle install
EXPOSE 9292
CMD bash -c "source /usr/local/rvm/scripts/rvm && bundle exec rackup -o 0.0.0.0 -p 9292"
