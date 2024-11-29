
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
    ## Works
    # options = Selenium::WebDriver::Options.chrome(args: ['--headless=new'])
    # @driver = Selenium::WebDriver.for :chrome, options: options

    ## Works
    options = Selenium::WebDriver::Options.chrome
    options.add_argument("--remote-debugging-port=9222")
    @driver = Selenium::WebDriver.for( :remote, {
      url: "http://#{SELENIUM_HOST}:4444/wd/hub",
      options: options,
    })
  end

  it 'sanity' do
    @headlines = []

    visit 'https://www.zerohedge.com/'

    all("div[class^='ContributorArticleFeatured_container__'").each do |item|
      @headlines.push({
        title:    item.find('h2').text,
        author:   item.find("[class^='ContributorArticleFeatured_author__']").text,
        subtitle: item.find("[class^='ContributorArticleFeatured_text__']").text,
      })
    end

    all("div[class^='Article_stickyContainer__'").each do |item|
      @headlines.push({
        title: item.find('h2').text,
        subtitle: item.find("div[class^='Article_desktopLineClamp__']").text,
      })
    end

    all("div[class^='Article_nonStickyContainer__'").each do |item|
      @headlines.push({
        title: item.find('h2').text,
        subtitle: item.find("div[class^='Article_desktopLineClamp__']").text,
      })
    end

    @headlines.each do |headline|
      puts '+++ +++'
      puts headline[:title]
      puts headline[:author] if headline[:author]
      puts headline[:subtitle]
      puts ''
    end

    sleep 10 # seconds
  end

end

