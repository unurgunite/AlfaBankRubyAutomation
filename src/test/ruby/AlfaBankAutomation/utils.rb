
class Utils

  def calculate_result(rate)
    sum = 9_600_000
    i = (rate / 12.0) / 100.0
    period_months = 20 * 12
    koef = (i * ((i + 1)**period_months)) / (((i + 1)**period_months) - 1)
    number = sum * koef

    # number.round(2)
    # print(number)
    # print(number.class)
  end

  def generate_random_interest_rate
    number = rand(5.0..12.0)
    number.round(2)
  end
end

# a = Utils.new
#
# print(a.calculate_result(5))
