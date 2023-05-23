# frozen_string_literal: true

class BaseCalculator
  def calculate(product)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
