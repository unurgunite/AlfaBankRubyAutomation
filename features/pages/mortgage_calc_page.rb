# frozen_string_literal: true

require_relative '../locators/mortgage_calc_locators'
require 'selenium-webdriver'

class MortgageCalc < Locators::MortgageCalcLocators # :nodoc:
  @down_payment_should_be = 2_400_000
  @loan_sum_should_be = 9_600_000
  specs = %i[header_exists by_estate_price_link_exists by_loan_amount_link_exists estate_price_text_exists
             down_payment_text_exists loan_sum_text_exists interest_rate_text_exists mortgage_term_text_exists
             payment_radiobtn_text_exists]

  Locators::MortgageCalcLocators.constants.each do |const|
    specs.each do |m|
      define_method m do |driver|
        m.to_s.split('_').insert(-2, 'does not').join(' ') if driver.find_element(:css, const).nil?
      end
    end
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

    raise 'Down_payments do not match!' unless down_payment.to_i == @down_payment_should_be

    raise 'Loan sums do not match!' unless loan_sum == @loan_sum_should_be
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
    return unless driver.find_element(:css, DIFFERENTIAL_RADIOBUTTON).attribute('checked')

    raise 'DIFFERENTIAL RADIOBUTTON IS CHECKED'
  end

  def click_submit_button(driver)
    driver.find_element(:css, SUBMIT_BUTTON).click
  end

  def find_and_compare_calc_result(driver, expected)
    wait = Selenium::WebDriver::Wait.new(timeout: 15)

    result = wait.until do
      element = driver.find_element(:css, CALCULATION_RESULT_MONTHLY_PAYMENT_TEXT)
      element.text if element.displayed?
    end

    result = result.gsub(/\s+/, '').gsub(',', '.').to_f
    expected = expected.round(2)

    raise 'oof' unless result == expected

    puts '___________TEST OK :)___________'
  end
end
