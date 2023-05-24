# frozen_string_literal: true

require 'bigdecimal'

class BaseCalculator
  def calculate(product)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
