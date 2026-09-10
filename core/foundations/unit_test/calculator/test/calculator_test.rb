require_relative '../src/calculator'

RSpec.describe Calculator do
  describe '.addition' do
    it 'returns the sum of two numbers' do
      expect(Calculator.addition(2, 3)).to eq(5)
    end
  end

  describe '.subtraction' do
    it 'returns the difference of two numbers' do
      expect(Calculator.subtraction(5, 2)).to eq(3)
    end
  end

  describe '.multiplication' do
    it 'returns the product using repeated addition' do
      expect(Calculator.multiplication(3, 4)).to eq(12)
    end
  end

  describe '.division' do
    it 'returns the quotient using repeated subtraction' do
      expect(Calculator.division(10, 3)).to eq(3)
    end
  end

  describe '.modulus' do
    it 'returns the remainder using division and multiplication' do
      expect(Calculator.modulus(10, 3)).to eq(1)
    end
  end
end
