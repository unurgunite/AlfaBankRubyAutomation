@Annuity_Payment_Calc
Feature: Calculate an annuity payment using https://calcus.ru/kalkulyator-ipoteki online calculator
  In order to have checked validity of calculator results
  As a client
  I want to input mortgage conditions and make sure online calculator results match the numbers obtained manually.


  Scenario: Calculate mortgage annuity payment
    Given I open <website>
    And I have checked that calculator_header exists
    And I have checked that by_estate_price_link exists
    And I have checked that by_loan_sum_link exists
    And I have checked that down_payment_text exists
    And I have checked that loan_sum_text exists
    And I have checked that mortgage_term_text exists
    And I have checked that interest_rate_text exists
    And I have checked that monthly_payment_type_text exists
    And I have entered <real_estate_cost> price
    And I have entered <mortgage_down_payment> payment
    And I have selected percentage from RUB_currency_or_percentage dropdown window
    And I have entered <mortgage_term> term
    And I have selected years from years_or_months dropdown window
    And I have entered <interest_rate>
    And I have ticked the annuity radiobutton
    When I press submit button
    Then the monhtly_payment should be equal to calculation on the screen

    Example:
      | website                    | https://calcus.ru/kalkulyator-ipoteki |
      | real_estate_cost           | 12000000                              |
      | mortgage_down_payment      | 20                                    |
      | RUB_currency_or_percentage | %                                     |
      | interest_rate              | argument                              |
      | mortgage_term              | 20                                    |
      | button                     | Рассчитать                            |