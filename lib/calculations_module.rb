require 'bigdecimal'

module Calculations

  def sum(array)
    array.reduce(:+).to_f
  end

  def mean(array)
    (sum(array))/(array.length).to_f
  end

  def standard_deviation(array)
    result = array.reduce(0) do |sum, item|
      sum + ((item - mean(array))**2)
    end/(array.length - 1)
    Math.sqrt(result).round(2)
  end

  def threshold(array, num_std_devs)
    (mean(array) + num_std_devs * standard_deviation(array)).round(2)
  end

end