# frozen_string_literal: true

module Locators

  class MortgageCalcLocators

    REAL_ESTATE_COST_TEXTBOX = '[name="cost"]'
    MORTGAGE_DOWN_PAYMENT_TEXTBOX = '[name="start_sum"]'
    RUB_CURRENCY_OR_PERCENTAGE_DROPDOWN = 'select[name="start_sum_type"]'
    RUB_CURRENCY_OR_PERCENTAGE_DROPDOWN_SELECT_OPTION_1 = 'select[name="start_sum_type"] > option[value="1"]'
    RUB_CURRENCY_OR_PERCENTAGE_DROPDOWN_SELECT_OPTION_2 = 'select[name="start_sum_type"] > option[value="2"]'
    MORTGAGE_TERM_TEXTBOX = 'input[name="period"]'
    YEARS_OR_MONTHS_DROPDOWN = 'select[name="period_type"]'
    YEARS_OR_MONTHS_DROPDOWN_SELECT_OPTION_M = 'select[name="period_type"] > option[value="M"]'
    YEARS_OR_MONTHS_DROPDOWN_SELECT_OPTION_Y = 'select[name="period_type"] > option[value="Y"]'
    INTEREST_RATE_TEXTBOX = 'input[name="percent"]'
    ANNUITY_RADIOBUTTON = '[for="payment-type-1"]'
    DIFFERENTIAL_RADIOBUTTON = '[for="payment-type-2"]'
    SUBMIT_BUTTON = 'input[class="calc-submit"]'
    CALCULATION_RESULT_MONTHLY_PAYMENT_TEXT = '.calc-result-value.result-placeholder-monthlyPayment'

  end
end