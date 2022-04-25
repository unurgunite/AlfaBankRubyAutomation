require_relative '../locators/mortgage_calc_locators'
require 'selenium-webdriver'

class MortgageCalc < Locators::MortgageCalcLocators

  @@down_payment_should_be = 2_400_000
  @@loan_sum_should_be = 9_600_000

  def header_exists(driver)
    raise 'header text does not exist' if driver.find_element(:css, HEADER).nil?
  end

  def by_estate_price_link_exists(driver)
    raise 'estate price link does not exist' if driver.find_element(:css, BY_PRICE_LINK).nil?
  end

  def by_loan_amount_link_exists(driver)
    raise 'loan amount link does not exist' if driver.find_element(:css, BY_LOAN_AMOUNT_LINK).nil?
  end

  def estate_price_text_exists(driver)
    raise 'estate price text does not exist' if driver.find_element(:css, ESTATE_PRICE_TEXT).nil?
  end

  def down_payment_text_exists(driver)
    raise 'down payment text does not exist' if driver.find_element(:css, DOWN_PAYMENT_TEXT).nil?
  end

  def loan_sum_text_exists(driver)
    raise 'loan sum text does not exist' if driver.find_element(:css, LOAN_SUM_TEXT).nil?
  end

  def interest_rate_text_exists(driver)
    raise 'interest rate text does not exist' if driver.find_element(:css, INTEREST_RATE_TEXT).nil?
  end

  def mortgage_term_text_exists(driver)
    raise 'mortgage term text does not exist' if driver.find_element(:css, MORTGAGE_TERM_TEXT).nil?
  end

  def payment_radiobtn_text_exists(driver)
    raise 'radiobutton text does not exist' if driver.find_element(:css, PAYMENT_RADIOBUTTON_TEXT).nil?
  end

  def print_real_estate
    puts REAL_ESTATE_COST_TEXTBOX
  end

  def enter_real_estate_cost(driver, string)
    element = driver.find_element(:css, REAL_ESTATE_COST_TEXTBOX)
    element.click
    element.send_keys(string)

  end

  def filter(input, allowed)
    input.chars.inject('') do |result, char|
      result << char if allowed.include? char
      result
    end
  end

  def enter_mortgage_down_payment(driver, string)
    driver.find_element(:css, MORTGAGE_DOWN_PAYMENT_TEXTBOX).send_keys(string)

    down_payment = driver.find_element(:css, MORTGAGE_RESULT).text.gsub('(', '').gsub(')', '')
    down_payment = filter(down_payment, '0123456789').to_i
    loan_sum = driver.find_element(:css, LOAN_SUM_RESULT).text.gsub(/\s+/, '').to_i

    raise 'Down_payments do not match!' if down_payment.to_i != @@down_payment_should_be

    raise 'Loan sums do not match!' if loan_sum != @@loan_sum_should_be
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
    sleep(2)
  end

  def click_submit_button(driver)
    driver.find_element(:css, SUBMIT_BUTTON).click
  end

  def find_and_compare_calc_result(driver, expected)

    wait = Selenium::WebDriver::Wait.new(:timeout => 15)

    result = wait.until {
      element = driver.find_element(:css, CALCULATION_RESULT_MONTHLY_PAYMENT_TEXT)
      element.text if element.displayed?
    }

    result = result.gsub(/\s+/, '').gsub(',', '.').to_f
    expected = expected.round(2)

    raise 'oof' if result != expected

    puts '___________TEST OK :)________________'
  end
end
#
# test = MortgageCalc.new
#
# test.header_exists