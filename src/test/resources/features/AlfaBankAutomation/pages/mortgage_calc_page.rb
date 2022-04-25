require_relative '../locators/mortgage_calc_locators'
require 'selenium-webdriver'

class MortgageCalc < Locators::MortgageCalcLocators

  def header_exists(driver)
    element = driver.findElement()
  end

  def by_estate_price_link_exists(driver)

  end

  def by_loan_amount_link_exists(driver)

  end

  def estate_price_text_exists(driver)

  end

  def down_payment_text_exists(driver)

  end

  def loan_sum_text_exists(driver)

  end

  def interest_rate_text_exists(driver)

  end

  def mortgage_term_text_exists(driver)

  end

  def payment_radiobtn_text_exists(driver)

  end

  def print_real_estate(driver)
    puts REAL_ESTATE_COST_TEXTBOX
  end

  def initialize
    super() # make all locators avaliable within this class
  end

  def enter_real_estate_cost(string)

  end

end
#
# test = MortgageCalc.new
#
# test.header_exists