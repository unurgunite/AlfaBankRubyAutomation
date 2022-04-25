# frozen_string_literal: true

class Utils # :nodoc:
  def calculate_result(rate)
    sum = 9_600_000
    i = (rate / 12.0) / 100.0
    period_months = 20 * 12
    coefficient = (i * ((i + 1)**period_months)) / (((i + 1)**period_months) - 1)
    sum * coefficient
  end

  def generate_random_interest_rate
    number = rand(5.0..12.0)
    number.round(2)
  end
end
