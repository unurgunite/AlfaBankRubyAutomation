@Annuity_Payment_Calc
Feature: Calculate an annuity payment using https://calcus.ru/kalkulyator-ipoteki online calculator
  In order to check validity of calculator results
  As a client
  I want to input mortgage conditions and make sure online calculator results match the numbers obtained manually.


  Scenario: Calculate mortgage annuity payment
    Given I open <website>
    And I have entered <real_estate_cost>
    And I have entered <mortgage_down_payment>
    And I have selected <RUB_currency_or_percentage> from dropdown window
    And I have entered <mortgage_term>
    And I have selected <years_or_months> from dropdown window
    And I have entered <interest_rate>
    And I have ticked the "annuity" radiobutton
    When I press <button>
    Then the monhtly_payment should be equal to <calculation> on the screen

    Example:
      | website                    | https://calcus.ru/kalkulyator-ipoteki |
      | real_estate_cost           | 12000000                              |
      | mortgage_down_payment      | 20                                    |
      | RUB_currency_or_percentage | %                                     |
      | mortgage_term              | 20                                    |
      | years_or_months            | years                                 |
      | interest_rate              | random_interest_rate                  |
      | button                     | Рассчитать                            |
      | calculation                | manual_calculation                    |