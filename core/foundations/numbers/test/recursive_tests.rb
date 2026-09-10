require_relative '../src/numbers'

RSpec.describe 'Recursive' do
  describe '.sum_of_first_n_rec' do
    it 'calculates the sum of first n numbers' do
      expect(Numbers.sum_of_first_n_rec(0)).to eq(0)
      expect(Numbers.sum_of_first_n_rec(3)).to eq(6)
    end
  end

  describe '.factorial_rec' do
    it 'calculates the factorial of n' do
      expect(Numbers.factorial_rec(0)).to eq(1)
      expect(Numbers.factorial_rec(4)).to eq(24)
    end
  end

  describe '.fibonacci_rec' do
    it 'calculates the nth Fibonacci number' do
      expect(Numbers.fibonacci_rec(0)).to eq(0)
      expect(Numbers.fibonacci_rec(1)).to eq(1)
      expect(Numbers.fibonacci_rec(6)).to eq(8)
    end
  end

  describe '.greatest_common_divisor_rec' do
    it 'calculates the greatest common divisor' do
      expect(Numbers.greatest_common_divisor_rec(12, 8)).to eq(4)
      expect(Numbers.greatest_common_divisor_rec(7, 5)).to eq(1)
    end
  end

  describe '.least_common_multiple_rec' do
    it 'calculates the least common multiple' do
      expect(Numbers.least_common_multiple_rec(4, 6)).to eq(12)
      expect(Numbers.least_common_multiple_rec(6, 8)).to eq(24)
    end
  end
end
