module Locators
  class MortgageCalcLocators
    element :real_estate_cost_textbox, '[name="cost"]'
    element :mortgage_down_payment_textbox, '[name="start_sum"]'
    element :rub_currency_or_percentage_dropdown, 'select[name="start_sum_type"]'
    element :rub_currency_or_percentage_dropdown_select_option, 'select[name="start_sum_type"] > option[value="2"]'
    element :mortgage_term_textbox, 'input[name="period"]'
    element :years_or_months_dropdown, 'select[name="period_type"]'
    element :years_or_months_dropdown_select_option, 'select[name="period_type"] > option[value="Y"]'
    element :interest_rate_textbox, 'input[name="percent"]'
    element :annuity_radiobutton, '[for="payment-type-1"]'
    element :differential_radiobutton, '[for="payment-type-2"]'
    element :submit_button, 'input[class="calc-submit"]'
    element :calculation_result_monthly_payment, '.calc-result-value.result-placeholder-monthlyPayment'

  end
end
