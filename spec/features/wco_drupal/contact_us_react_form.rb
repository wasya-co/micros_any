
require 'capybara/rspec'

Capybara.register_driver :remote_selenium do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument("--window-size=1400,700")
  options.add_argument("--no-sandbox")
  options.add_argument("--disable-dev-shm-usage")
  options.add_argument("--remote-debugging-port=9222")

  Capybara::Selenium::Driver.new(
    app,
    browser: :remote,
    url: "http://#{SELENIUM_HOST}:4444/wd/hub",
    options: options,
  )
end

Capybara.register_driver :remote_selenium_headless do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument("--headless")
  options.add_argument("--window-size=1400,1400")
  options.add_argument("--no-sandbox")
  options.add_argument("--disable-dev-shm-usage")

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    url: "http://#{SELENIUM_HOST}:4444/wd/hub",
    options: options,
  )
end

Capybara.register_driver :local_selenium do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument("--window-size=1400,700")

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.register_driver :local_selenium_headless do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument("--headless")
  options.add_argument("--window-size=1400,1400")
  options.add_argument("--disable-dev-shm-usage")

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.default_driver = :local_selenium
Capybara.default_max_wait_time = 100 # seconds

RSpec.describe 'wco contact_us form' do

  before :all do
    options = Selenium::WebDriver::Options.chrome(args: ['--headless=new'])
    @driver = Selenium::WebDriver.for :chrome, options: options

    ## From: https://www.selenium.dev/documentation/webdriver/drivers/remote_webdriver/
    # options = Selenium::WebDriver::Options.chrome
    # @driver = Selenium::WebDriver.for( :remote, {
    #   url: "http://#{SELENIUM_HOST}:4444/wd/hub",
    #   options: options,
    # })
  end

  it 'sanity' do
    visit 'https://wasya.co/user/login'
    fill_in 'name', with: TEST_USER
    fill_in 'pass', with: TEST_PASSWD
    click_on('op')

    find('#superfish-main > :nth-child(1)').hover ## Consulting
    find('#main-menu-link-content0d4a10e6-2cdf-4df4-a75a-26b561748fd0 a').click ## reactjs development
    find('a[data-entity-uuid="6cd82a74-b8a4-4663-aab8-199d0fd230d9"]').click ## [v2]

    fill_in 'your_name', with: 'test-1 name'
    fill_in 'your_email', with: 'test-1@piousbox.com'
    fill_in 'your_company_name', with: 'test-1 name'
    fill_in 'please_describe_your_project', with: 'project description'

    click_on('op')
    find('.webform-confirmation__message').text.should eql "New submission added to Project Intake 0.0.1-Card."
    sleep 10 # seconds
  end

end

