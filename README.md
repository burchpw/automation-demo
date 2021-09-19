# Automation Demo Project

## Mac Setup
1. Install [Homebrew](https://brew.sh/) for package management
2. Use Homebrew to install [asdf](https://asdf-vm.com/guide/getting-started.html#_1-install-dependencies) for dependency management
3. Use asdf to install [ruby plugin](https://github.com/asdf-vm/asdf-ruby)
4. Use asdf ruby plugin to install Ruby 2.7.4: `asdf install ruby 2.7.4`
5. Clone the Github repository locally: `git clone #{git repo address}`
6. Change working directory to `automation-demo`
7. Set the local asdf ruby version: `asdf local ruby 2.7.4`
8. Install [bundler](https://bundler.io/): `gem install bundler -v 2.2.27`
9. Use Bundler to install Ruby Gems: `bundle install`

## Frame Works Used
1. [Rspec](https://rspec.info/documentation/)
2. [Capybara](https://github.com/teamcapybara/capybara)
3. [Site Prism](https://github.com/site-prism/site_prism)

## Other Tech
1. [Docker](https://www.docker.com/)
2. [Docker Selenium](https://github.com/SeleniumHQ/docker-selenium)
3. [VNC Viewer](https://www.realvnc.com/en/connect/download/viewer/)

## Debuging Web Test
Follow information [here](https://github.com/SeleniumHQ/docker-selenium#debugging)
Use the following command to start a docker container running VNC: 
`docker run -d -p 4445:4444 -p 5900:5900 --shm-size="2g" selenium/standalone-firefox:4.0.0-rc-2-prerelease-20210916`
Use VNC viewer to connect and watch the test execute