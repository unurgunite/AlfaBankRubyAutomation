
begin

  require 'selenium-webdriver'

  Before('@Annuity_Payment_Calc') do
    @mortgage_website = MortgageCalc.new
  end

  Before('@Annuity_Payment_Calc') do
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--ignore-certificate-errors')
    options.add_argument('--disable-popup-blocking')
    options.add_argument('--disable-translate')
    @driver = Selenium::WebDriver.for :chrome, options: options
  end

  After('@Annuity_Payment_Calc') do
    @driver.quit
  end

  After do
  end


  Given(/^I open (.*)$/) do |website|
    @driver.get(website)
  end

  And(/^I check that calculator_header exists$/) do
    @mortgage_website.header_exists(@driver)
  end

  And(/^I check that by_estate_price_link exists$/) do
    @mortgage_website.by_estate_price_link_exists(@driver)
  end

  And(/^I check that by_loan_sum_link exists$/) do
    @mortgage_website.by_loan_amount_link_exists(@driver)
  end

  And(/^I check that down_payment_text exists$/) do
    @mortgage_website.down_payment_text_exists(@driver)
  end

  And(/^I check that loan_sum_text exists$/) do
    @mortgage_website.loan_sum_text_exists(@driver)
  end

  And(/^I check that mortgage_term_text exists$/) do
    @mortgage_website.mortgage_term_text_exists(@driver)
  end

  And(/^I check that interest_rate_text exists$/) do
    @mortgage_website.interest_rate_text_exists(@driver)
  end

  And(/^I check that monthly_payment_type_text exists$/) do
    @mortgage_website.payment_radiobtn_text_exists(@driver)
  end

  And(/^I have entered (.*) price$/) do |real_estate_cost|
    pending
  end

  And(/^I have entered (.*) payment$/) do |mortgage_down_payment|
    pending
  end

  And(/^I have selected percentage from RUB_currency_or_percentage dropdown window$/) do
    pending
  end

  And(/^I have entered (.*) term$/) do |mortgage_term|
    pending
  end

  And(/^I have selected years from years_or_months dropdown window$/) do
    pending
  end

  And(/^I have entered interest_rate$/) do
    pending
  end

  And(/^I have ticked the "([^"]*)" radiobutton$/) do |arg|
    pending
  end

  When(/^I press (.*)$/) do |button|
    pending
  end

  Then(/^the monhtly_payment should be equal to (.*) on the screen$/) do |calculation|
    pending
  end
end


