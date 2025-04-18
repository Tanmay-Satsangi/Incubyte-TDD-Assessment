require 'rails_helper'

RSpec.describe StringCalculator, type: :service do
  describe '#add' do
    it 'returns 0 for an empty string' do
      calculator = StringCalculator.new
      expect(calculator.add("")).to eq(0)
    end

    it 'returns the number itself for a single number' do
      calculator = StringCalculator.new
      expect(calculator.add("1")).to eq(1)
    end

    it 'returns the sum of two numbers separated by a comma' do
      calculator = StringCalculator.new
      expect(calculator.add("1,5")).to eq(6)
    end

    it 'returns the sum of numbers with a newline separator' do
      calculator = StringCalculator.new
      expect(calculator.add("1\n2,3")).to eq(6)
    end

    it 'returns the sum of numbers with a custom delimiter' do
      calculator = StringCalculator.new
      expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it 'raises an error when a negative number is passed' do
      calculator = StringCalculator.new
      expect { calculator.add("1,-2,3") }.to raise_error("negative numbers not allowed: -2")
    end

    it 'raises an error when multiple negative numbers are passed' do
      calculator = StringCalculator.new
      expect { calculator.add("1,-2,-3") }.to raise_error("negative numbers not allowed: -2,-3")
    end
  end
end
