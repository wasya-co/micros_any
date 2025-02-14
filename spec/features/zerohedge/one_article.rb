
require 'capybara/rspec'
require 'capybara_helper'

Capybara.default_driver = :local_selenium_headless
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

    begin
      @article[:title]  = find("[class^='ArticleFull_header__']").find('h1').text
    rescue Capybara::ElementNotFound => err
      @article[:title]  = find("[class^='ContributorArticleFull_header__']").find('h1').text
    end
    @article[:html]   = find("[class^='NodeContent_body__']")['innerHTML'] ## @article[:html] = find("[class^='NodeBody_container__']")['innerHTML']
    @article[:text]   = find("[class^='NodeContent_body__']").text.gsub(/\n/, "\n\n")

    puts "+++ +++ #{@article[:title]}"
    puts @article[:text]

    sleep 10 # seconds
  end

end

