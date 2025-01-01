
require 'capybara/rspec'

Capybara.register_driver :local_selenium do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument("--window-size=1400,700")
  # options.add_argument("--remote-debugging-port=9222")

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end
Capybara.default_driver = :local_selenium
Capybara.default_max_wait_time = 10 # seconds

RSpec.describe 'scrape zerohedge frontpage' do

  before :all do
    ## Works, non-remote : )
    options = Selenium::WebDriver::Options.chrome(args: ['--headless=new'])
    @driver = Selenium::WebDriver.for :chrome, options: options

    ## Works, remote
    # options = Selenium::WebDriver::Options.chrome
    # options.add_argument("--remote-debugging-port=9222")
    # @driver = Selenium::WebDriver.for( :remote, {
    #   url: "http://#{SELENIUM_HOST}:4444/wd/hub",
    #   options: options,
    # })
  end

  it 'sanity' do
    if !ENV['URL']
      puts! "Usage: URL=<zerohedge url> be rspec spec/features/zerohedge/one_article.rb"
      exit -1
    end

    @article = {}
    visit ENV['URL']

    @article[:title]  = find("[class^='ArticleFull_header__']").find('h1').text
    @article[:html]   = find("[class^='NodeContent_body__']")['innerHTML'] ## @article[:html] = find("[class^='NodeBody_container__']")['innerHTML']
    @article[:text]   = find("[class^='NodeContent_body__']").text.gsub(/\n/, "\n\n")

    puts "+++ +++ #{@article[:title]}"
    puts @article[:text]

    sleep 10 # seconds
  end

end

