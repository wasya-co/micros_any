
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
    ## 2024-11-28 :: Currently using this.
    options = Selenium::WebDriver::Options.chrome(args: ['--headless=new'])
    @driver = Selenium::WebDriver.for :chrome, options: options

    ## 2024-11-27 :: From: https://www.selenium.dev/documentation/webdriver/drivers/remote_webdriver/
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

    find('#superfish-main > :nth-child(3)').hover
    find('#main-menu-link-contentcb0b4685-7cd8-45c4-91d7-1083bf767bd7 a').click

    fill_in 'your_name', with: 'test-1 name'
    fill_in 'your_email', with: 'test-1@piousbox.com'
    fill_in 'your_company_name', with: 'test-1 name'
    fill_in 'please_describe_your_project', with: 'project description'

    click_on('op')
    find('.webform-confirmation__message').text.should eql "New submission added to Project Intake 0.0.0."
    sleep 10 # seconds
  end

=begin
  it 'Fintech Digital Snapshot' do

    visit 'http://fedfis-fe.local'
    fill_in('username', with: 'piousbox')
    fill_in('password', with: 'test1234')
    click_on('Sign In')
    click_on('Fintech Digital Snapshot')

    n = 10
    total_time = 0

    # all('h6').each_with_index do |h6, idx|
    (1..n).each do |idx|
      begin_time = Time.now

      fintech_name = find(:xpath, "(//h6)[#{idx}]").text
      find(:xpath, "(//h6)[#{idx}]").click
      n_installs = find(".MuiGrid-item:nth-child(1) .MuiCardContent-root h5:nth-child(2)").text

      click_on('Go Back')

      time_delta = Time.now - begin_time
      total_time += time_delta
      puts "+++ Fintech Name: #{fintech_name}\t\tn_installs: #{n_installs}\t\ttime_delta: #{time_delta}"
    end

    puts "avg time: #{total_time/n}"
    # byebug
  end
=end

end

