class Utils

  def calculate_result(rate)
    sum = 9_600_000
    int i = (rate / 12) / 100
    period_months = 20 * 12
    koef = (i * ((i + 1)**period_months)) / (((i + 1)**period_months) - 1)
    sum * koef
  end

  def generate_random_interest_rate
    number = rand(5.0..12.0)
    number.round(2)
  end

end
