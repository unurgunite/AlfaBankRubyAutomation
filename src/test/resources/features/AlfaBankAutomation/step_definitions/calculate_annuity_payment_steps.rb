begin

  require 'selenium-webdriver'
  require_relative '../../../../ruby/AlfaBankAutomation/utils'
  require_relative '../pages/mortgage_calc_page'

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

  Before('@Annuity_Payment_Calc') do
    @util = Utils.new
  end

  Before('@Annuity_Payment_Calc') do
    @rate = @util.generate_random_interest_rate
  end

  After('@Annuity_Payment_Calc') do
    @driver.quit
  end

  After do
  end

  Given(/^I open website$/) do
    @driver.get 'https://calcus.ru/kalkulyator-ipoteki'
  end

  # Я категорически против проверок на существование текстовых полей в GIVEN части.
  # Это должны быть отдельные тесты! Почему тест должен падать из-за неправильного текста?
  # Он должен падать из-за неверных вычислений в WHEN\THEN!

  And(/^I have checked that calculator_header exists$/) do
    @mortgage_website.header_exists(@driver)
  end

  And(/^I have checked that by_estate_price_link exists$/) do
    @mortgage_website.by_estate_price_link_exists(@driver)
  end

  And(/^I have checked that by_loan_sum_link exists$/) do
    @mortgage_website.by_loan_amount_link_exists(@driver)
  end

  And(/^I have checked that down_payment_text exists$/) do
    @mortgage_website.down_payment_text_exists(@driver)
  end

  And(/^I have checked that loan_sum_text exists$/) do
    @mortgage_website.loan_sum_text_exists(@driver)
  end

  And(/^I have checked that mortgage_term_text exists$/) do
    @mortgage_website.mortgage_term_text_exists(@driver)
  end

  And(/^I have checked that interest_rate_text exists$/) do
    @mortgage_website.interest_rate_text_exists(@driver)
  end

  And(/^I have checked that monthly_payment_type_text exists$/) do
    @mortgage_website.payment_radiobtn_text_exists(@driver)
  end

  And(/^I have entered real_estate_cost price$/) do

    @mortgage_website.enter_real_estate_cost(@driver, 12_000_000)
  end

  And(/^I have selected percentage from RUB_currency_or_percentage dropdown window$/) do
    @mortgage_website.select_percent_from_dropdown(@driver)
  end

  And(/^I have entered mortgage_down_payment payment$/) do
    @mortgage_website.enter_mortgage_down_payment(@driver, 20)
  end

  And(/^I have entered mortgage_term term$/) do
    @mortgage_website.enter_mortgage_term(@driver, 20)
  end

  And(/^I have selected years from years_or_months dropdown window$/) do
    @mortgage_website.select_year_from_dropdown(@driver)
  end

  And(/^I have entered interest_rate$/) do |interest_rate = @rate|
    @mortgage_website.enter_interest_rate(@driver, interest_rate)
  end

  And(/^I have ticked the annuity radiobutton$/) do
    @mortgage_website.select_annuity_radiobutton(@driver)
  end

  When(/^I press submit button$/) do
    @mortgage_website.click_submit_button(@driver)
  end

  Then(/^the monhtly_payment should be equal to calculation on the screen$/) do
    @mortgage_website.find_and_compare_calc_result(@driver, @util.calculate_result(@rate))
  end
end
