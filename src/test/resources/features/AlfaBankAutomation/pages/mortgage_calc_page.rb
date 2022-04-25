# frozen_string_literal: true
require_relative '../locators/mortgage_calc_locators'
require 'selenium-webdriver'

class MortgageCalc < Locators::MortgageCalcLocators

  def header_exists(driver)
    raise 'header text does not exist' if driver.find_element(:css, HEADER).empty?
  end

  def by_estate_price_link_exists(driver)
    raise 'estate price link does not exist' if driver.find_element(:css, BY_PRICE_LINK).empty?
  end

  def by_loan_amount_link_exists(driver)
    raise 'loan amount link does not exist' if driver.find_element(:css, BY_LOAN_AMOUNT_LINK).empty?
  end

  def estate_price_text_exists(driver)
    raise 'estate price text does not exist' if driver.find_element(:css, ESTATE_PRICE_TEXT).empty?
  end

  def down_payment_text_exists(driver)
    raise 'down payment text does not exist' if driver.find_element(:css, DOWN_PAYMENT_TEXT).empty?
  end

  def loan_sum_text_exists(driver)
    raise 'loan sum text does not exist' if driver.find_element(:css, LOAN_SUM_TEXT).empty?
  end

  def interest_rate_text_exists(driver)
    raise 'interest rate text does not exist' if driver.find_element(:css, INTEREST_RATE_TEXT).empty?
  end

  def mortgage_term_text_exists(driver)
    raise 'mortgage term text does not exist' if driver.find_element(:css, MORTGAGE_TERM_TEXT).empty?
  end

  def payment_radiobtn_text_exists(driver)
    raise 'radiobutton text does not exist' if driver.find_element(:css, PAYMENT_RADIOBUTTON_TEXT).empty?
  end

  def print_real_estate
    puts REAL_ESTATE_COST_TEXTBOX
  end

  def enter_real_estate_cost(driver, string)
    driver.find_element(:css, REAL_ESTATE_COST_TEXTBOX).send_keys(string)
  end

  def enter_mortgage_down_payment(driver, string)
    driver.find_element(:css, MORTGAGE_DOWN_PAYMENT_TEXTBOX).send_keys(string)
  end

  def enter_mortgage_term(driver, string)
    driver.find_element(:css, MORTGAGE_TERM_TEXTBOX).send_keys(string)
  end

  def enter_interest_rate(driver, number)
    driver.find_element(:css, INTEREST_RATE_TEXTBOX).send_keys(number)
  end

  def select_year_from_dropdown(driver)
    driver.find_element(:css, YEARS_OR_MONTHS_DROPDOWN).click
    driver.find_element(:css, YEARS_OR_MONTHS_DROPDOWN_SELECT_OPTION_Y).click
  end

  def select_percent_from_dropdown(driver)
    driver.find_element(:css, RUB_CURRENCY_OR_PERCENTAGE_DROPDOWN).click
    driver.find_element(:css, PERCENTAGE_DROPDOWN_SELECT_OPTION_2).click
  end
  
  def select_annuity_radiobutton(driver)
    driver.find_element(:css, ANNUITY_RADIOBUTTON).click
  end
  
  def click_submit_button(driver)
    driver.find_element(:css, SUBMIT_BUTTON).click
  end


  
  def find_and_compare_calc_result(driver, expected)
    result = driver.find_element(:css, CALCULATION_RESULT_MONTHLY_PAYMENT_TEXT).waittext
    
    if result != expected
      raise 'oof'
    end
  end
end
#
# test = MortgageCalc.new
#
# test.header_exists