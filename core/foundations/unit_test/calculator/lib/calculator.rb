class Calculator
  def self.addition(a, b)
    a + b
  end

  def self.subtraction(a, b)
    a - b
  end

  def self.multiplication(a, b)
    result = 0
    b.times do
      result = addition(result, a)
    end
    result
  end

  def self.division(a, b)
    quotient = 0
    while a >= b
      a = subtraction(a, b)
      quotient = addition(quotient, 1)
    end
    quotient
  end

  def self.modulus(a, b)
    q = division(a, b)
    p = multiplication(q, b)
    subtraction(a, p)
  end
end
