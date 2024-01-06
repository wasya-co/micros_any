
== Install ==

  # psych on ubuntu
  apt install -y \
    libyaml-dev

== Troubleshoot ==

=== Selenium ===

From: https://www.selenium.dev/blog/2023/headless-is-going-away/

  options = Selenium::WebDriver::Options.chrome(args: ['--headless=new'])
  driver = Selenium::WebDriver.for :chrome, options: options
  driver.get('https://selenium.dev')
  driver.quit

=== keycloak ===
* 2023-12-15
* https://github.com/ccrockett/omniauth-keycloak?tab=readme-ov-file
** https://github.com/omniauth/omniauth
