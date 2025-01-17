
require 'capybara/rspec'
# require 'capybara_helper'

Capybara.register_driver :current_selenium_driver do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument("--window-size=502,2000")
  # options.add_argument("--headless")
  options.add_argument("--disable-dev-shm-usage")
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.default_driver = :current_selenium_driver
Capybara.default_max_wait_time = 10 # seconds

RSpec.describe 'wasya_co main issue' do
  before :all do
    options = Selenium::WebDriver::Options.chrome(args: ['--headless=new'])
    @driver = Selenium::WebDriver.for :chrome, options: options
  end

  it 'takes a screenshot' do
    visit 'https://wasya.co/issues/2024q1-issue'
    save_and_open_full_screenshot
  end

  ## From: https://stackoverflow.com/questions/11198882/how-do-you-test-if-a-div-has-a-certain-css-style-in-rspec-capybara
  ## From: https://www.rubydoc.info/github/jnicklas/capybara/Capybara%2FNode%2FMatchers:assert_matches_style
  it 'asserts matches style' do
    url = 'https://wasya.co/issues/2024q1-issue'
    # url = 'http://wco.local:8091/issues/2024q1-issue'
    visit url

    body_el = find('body')
    body_width = body_el.style('width')['width']
    # puts! body_width, 'body_width'

    find_all('.layout > .row').each do |el|
      el.assert_matches_style({ 'width' => body_width })
      print '.'
    end

    puts! 'ok'
    # byebug
  end

end

