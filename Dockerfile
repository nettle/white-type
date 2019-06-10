# Use ubuntu:latest (ubuntu:18.04)
FROM ubuntu

# Prepare update
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -qqy update
RUN apt-get -qqy install --no-install-recommends apt-utils

# Install required packages
RUN apt-get -qqy install build-essential ruby-full zlib1g-dev
RUN gem install jekyll bundler

# Setting work dir
WORKDIR /app
# Copy all files
COPY . /app

# Silence the warning Bundler prints when installing gems as root
ENV BUNDLE_SILENCE_ROOT_WARNING 1
RUN bundle install

# Run Jekyll
CMD jekyll serve --host=0.0.0.0
