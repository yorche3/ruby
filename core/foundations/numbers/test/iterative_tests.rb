require_relative '../src/numbers'

RSpec.describe 'Iterative' do
  describe '.sum_of_first_n_ite' do
    it 'calculates the sum of first n numbers' do
      expect(Numbers.sum_of_first_n_ite(0)).to eq(0)
      expect(Numbers.sum_of_first_n_ite(3)).to eq(6)
    end
  end

  describe '.factorial_ite' do
    it 'calculates the factorial of n' do
      expect(Numbers.factorial_ite(0)).to eq(1)
      expect(Numbers.factorial_ite(4)).to eq(24)
    end
  end

  describe '.fibonacci_ite' do
    it 'calculates the nth Fibonacci number' do
      expect(Numbers.fibonacci_ite(0)).to eq(0)
      expect(Numbers.fibonacci_ite(1)).to eq(1)
      expect(Numbers.fibonacci_ite(6)).to eq(8)
    end
  end

  describe '.greatest_common_divisor_ite' do
    it 'calculates the greatest common divisor' do
      expect(Numbers.greatest_common_divisor_ite(12, 8)).to eq(4)
      expect(Numbers.greatest_common_divisor_ite(7, 5)).to eq(1)
    end
  end

  describe '.least_common_multiple_ite' do
    it 'calculates the least common multiple' do
      expect(Numbers.least_common_multiple_ite(4, 6)).to eq(12)
      expect(Numbers.least_common_multiple_ite(6, 8)).to eq(24)
    end
  end
end
