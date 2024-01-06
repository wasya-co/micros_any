
== Install ==

  # psych on ubuntu
  apt install -y \
    libyaml-dev

== Troubleshoot ==

=== Selenium ===

https://googlechromelabs.github.io/chrome-for-testing/#stable

export CHROME_VERSION=120.0.6099.109
wget --no-verbose -O /tmp/chrome.deb https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${CHROME_VERSION}_amd64.deb \
  && apt install -y /tmp/chrome.deb \
  && rm /tmp/chrome.deb

  CHROMEDRIVER_VERSION=120.0.6099.199 npm install -g chromedriver

From: https://www.selenium.dev/blog/2023/headless-is-going-away/

  options = Selenium::WebDriver::Options.chrome(args: ['--headless=new'])
  driver = Selenium::WebDriver.for :chrome, options: options
  driver.get('https://selenium.dev')
  driver.quit

=== keycloak ===
* 2023-12-15
* https://github.com/ccrockett/omniauth-keycloak?tab=readme-ov-file
** https://github.com/omniauth/omniauth
