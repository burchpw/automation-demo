# Automation Demo Project

Table of contents
1. [Setup For Mac](#mac-setup)
2. [Running Tests](#running-tests)
   - [Local Firefox Run](#local-firefox-run)
   - [Debugging Local Test](#debugging-local-test)
   - [Docker Compose Run](#docker-compose-test-run)
3. [Frameworks Used](#frameworks-used)
4. [Other Tech](#other-tech)
5. [Docker Image](#docker-image)
   - [Docker Image Build](#build)
   - [Docker Image Interactive Bash Session](#interactive-bash-session)
   - [Docker Prune](#prune-docker)
6. [Docker Compose](#docker-compose)
   - [Docker Compose Build](#docker-compose-build)
   - [Docker Compose Run Interactive](#docker-compose-run-interactive)
   - [Docker Compose Run Tests](#docker-compose-test-run)
7. [Encryption Setup](#encryption-setup)
   - [Generating PGP key with no passphrase](#generating-pgp-key-with-no-passphrase)
   - [Encrypt File](#encrypt-file)
   - [Decrypt File](#decrypt-file)
   - [Export Secret Key](#export-secret-key)
   - [Convert Private Key To Base64](#convert-private-key-to-base64)
   - [Import Secret Key](#import-secret-key)
   - [Adding Private Key to ENV](#adding-private-key-to-env)
    


# Mac Setup
1. Install [Homebrew](https://brew.sh/) for package management
2. Use Homebrew to install [asdf](https://asdf-vm.com/guide/getting-started.html#_1-install-dependencies) for dependency management
3. Use asdf to install [ruby plugin](https://github.com/asdf-vm/asdf-ruby)
4. Use asdf ruby plugin to install Ruby 2.7.4: `asdf install ruby 2.7.4`
5. Clone the Github repository locally: `git clone #{git repo address}`
6. Change working directory to `automation-demo`
7. Set the local asdf ruby version: `asdf local ruby 2.7.4`
8. Install [bundler](https://bundler.io/): `gem install bundler -v 2.2.27`
9. Use Bundler to install Ruby Gems: `bundle install`
10. Use Homebrew to install gpg version 2.2.37: `brew install gpg@2.2`
11. Use Homebrew to install sops version 3.7.1: `brew install sops`
12. Add private key to [ENV](#adding-private-key-to-env)

# Running Tests
## Local Firefox Run 
1. Start Firefox selenium docker container: `docker run -d -p 4445:4444 -p 5900:5900 --shm-size="2g" selenium/standalone-firefox:4.0.0-rc-2-prerelease-20210916`
2. From the project root run the following command: `BROWSER=firefox rspec ruby_code/specs/**/*_spec.rb`

## Debugging Local Test
Follow information [here](https://github.com/SeleniumHQ/docker-selenium#debugging)
Use the following command to start a docker container running VNC: 
`docker run -d -p 4445:4444 -p 5900:5900 --shm-size="2g" selenium/standalone-firefox:4.0.0-rc-2-prerelease-20210916`
Use VNC viewer to connect and watch the test execute

## Docker Compose Test Run
1. [Build](#docker-compose-build) a docker image
2. Run [this](#docker-compose-run-tests) command to run all tests

# Frameworks Used
1. [Rspec](https://rspec.info/documentation/)
2. [Capybara](https://github.com/teamcapybara/capybara)
3. [Site Prism](https://github.com/site-prism/site_prism)

# Other Tech
1. [Docker](https://www.docker.com/)
2. [Docker Selenium](https://github.com/SeleniumHQ/docker-selenium)
3. [VNC Viewer](https://www.realvnc.com/en/connect/download/viewer/)
4. [GPG](https://gnupg.org/)
5. [SOPS](https://github.com/mozilla/sops)

# Docker Image

## Build
Run the following command: `docker build -t automation-demo .`

## Interactive Bash Session
Run the following command: `docker run -it automation-demo /bin/bash`

## Prune Docker
Run the following command: `docker system prune`

# Docker Compose

## Docker Compose Build
Run the following command: `docker-compose build`

## Docker Compose Run Interactive
Run the following command to start a interactive docker compose session: ```docker-compose run --rm -v `pwd`/docker_test_results:/automation-demo/test_results test_worker bash```

## Docker Compose Run Tests
Run the following command to run all tests in docker compose: ``` docker-compose run --rm -v `pwd`/docker_test_results:/automation-demo/test_results test_worker bash -c  'bundle exec rspec ruby_code/specs/**/*_spec.rb'```

# Encryption Setup
PGP Version 2.2.31
SOPS Version 3.7.1

## Generating PGP key with no passphrase
```
gpg --batch --gen-key <<EOF
%no-protection
Key-Type:1
Key-Length:2048
Subkey-Type:1
Subkey-Length:2048
Name-Real: username
Name-Email: email@email.com
Expire-Date:0
EOF
```
## Encrypt File
`sops -p #{public key} -e credentials.yml > encpyted_credentials.yml`

## Decrypt File
`sops -d encpyted_credentials.yml > credentials.yml`

## Export Secret Key
`gpg --export-secret-key -a YOUR_ID_HERE > private.key`

## Convert Private Key To Base64
`cat private.key | base64`

## Import Secret Key
`gpg --batch --import private.key`

## Adding Private Key to ENV
1. Create a .env file
2. Use the [convert private key to base64](#convert-private-key-to-base64) command above
3. Copy the output string
4. Open the .env file
5. Add the following entry: `PRIVATE_KEY=#{paste from copied base64 output}`
6. Save the .env file
