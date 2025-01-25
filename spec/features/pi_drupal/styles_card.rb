
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

RSpec.describe 'pi_drupal (style)' do
  before :all do
    options = Selenium::WebDriver::Options.chrome(args: ['--headless=new'])
    @driver = Selenium::WebDriver.for :chrome, options: options
  end

  it 'thumb in Card has no more than 100% width' do
    url = 'https://piousbox.com/test'
    visit url

    find_all('article.Card').each do |el|
      expected_width = el.style('width')['width'].gsub('px', '').to_f -
        el.style('padding-left')['padding-left'].gsub('px', '').to_f -
        el.style('padding-right')['padding-right'].gsub('px', '').to_f
      img = el.find('.field--name-field-image-thumb')
      actual_width = img.style('width')['width'].gsub('px', '').to_f
      actual_width.should <= expected_width
    end

    puts! 'ok'
  end

end

