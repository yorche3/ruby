# frozen_string_literal: true

RSpec.describe DataStructuresBasics::Stack do
  let(:stack) { described_class.new }
  let(:empty_size) { 0 }
  let(:first_value) { 10 }
  let(:second_value) { 20 }
  let(:third_value) { 30 }
  let(:replacement_value) { 40 }
  let(:filled_size) { 3 }
  let(:failure_indicator) { -1 }

  def run_cases(cases)
    cases.each do |case_name, assertion|
      assertion.call(case_name)
    end
  end

  it "executes the stack scenarios" do
    run_cases(
      "empty state and failed removal" => lambda do |case_name|
        expect(stack.empty?).to be(true),
                                "#{case_name}: Stack should be empty after initialization"
        expect(stack.size).to eq(empty_size),
                              "#{case_name}: Stack should have size #{empty_size} after initialization"
        expect(stack.peek).to eq(failure_indicator),
                              "#{case_name}: Stack should return the failure indicator when peeking empty"
        expect(stack.pop).to eq(failure_indicator),
                             "#{case_name}: Stack should return the failure indicator when popping empty"
      end,
      "LIFO and non-mutating peek" => lambda do |case_name|
        stack.push(first_value)
        stack.push(second_value)
        stack.push(third_value)

        expect(stack.peek).to eq(third_value),
                              "#{case_name}: Stack should peek at its most recently pushed value"
        expect(stack.size).to eq(filled_size),
                              "#{case_name}: Stack peek should not change its size"
      end,
      "removal and reuse" => lambda do |case_name|
        expect(stack.pop).to eq(third_value),
                             "#{case_name}: Stack should pop its top value first"
        stack.push(replacement_value)

        expect(stack.pop).to eq(replacement_value),
                             "#{case_name}: Stack should pop a value pushed after reuse"
        expect(stack.pop).to eq(second_value),
                             "#{case_name}: Stack should preserve LIFO order after reuse"
        expect(stack.pop).to eq(first_value),
                             "#{case_name}: Stack should pop its earliest value last"
        expect(stack.empty?).to be(true),
                                "#{case_name}: Stack should be empty after all values are popped"
        expect(stack.size).to eq(empty_size),
                              "#{case_name}: Stack should have size #{empty_size} when empty"
      end,
      "empty after removal" => lambda do |case_name|
        expect(stack.pop).to eq(failure_indicator),
                             "#{case_name}: Stack should return the failure indicator after being emptied"
        expect(stack.empty?).to be(true),
                                "#{case_name}: Stack should remain empty after a failed pop"
      end
    )
  end
end
