# frozen_string_literal: true

module Locators

  class MortgageCalcLocators

    HEADER = 'h1:first-of-type'
    BY_PRICE_LINK = '[data-autofocus="cost"]'
    BY_LOAN_AMOUNT_LINK = '[data-autofocus="credit_sum"]'
    ESTATE_PRICE_TEXT = 'form[action="/kalkulyator-ipoteki"] :nth-child(6) > div:first-of-type'
    DOWN_PAYMENT_TEXT = 'form[action="/kalkulyator-ipoteki"] :nth-child(7) > div:first-of-type'
    LOAN_SUM_TEXT = 'form[action="/kalkulyator-ipoteki"] :nth-child(8) > div:first-of-type'
    INTEREST_RATE_TEXT = 'form[action="/kalkulyator-ipoteki"] :nth-child(12) > div:first-of-type'
    MORTGAGE_TERM_TEXT = 'form[action="/kalkulyator-ipoteki"] :nth-child(10) > div:first-of-type'
    PAYMENT_RADIOBUTTON_TEXT = 'form[action="/kalkulyator-ipoteki"] :nth-child(13) > div:first-of-type'

    REAL_ESTATE_COST_TEXTBOX = '[name="cost"]'
    MORTGAGE_DOWN_PAYMENT_TEXTBOX = '[name="start_sum"]'
    RUB_CURRENCY_OR_PERCENTAGE_DROPDOWN = 'select[name="start_sum_type"]'
    RUB_CURRENCY_DROPDOWN_SELECT_OPTION_1 = 'select[name="start_sum_type"] > option[value="1"]'
    PERCENTAGE_DROPDOWN_SELECT_OPTION_2 = 'select[name="start_sum_type"] > option[value="2"]'
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