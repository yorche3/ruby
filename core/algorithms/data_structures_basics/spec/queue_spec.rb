# frozen_string_literal: true

RSpec.describe DataStructuresBasics::Queue do
  let(:queue) { described_class.new }
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

  it "executes the queue scenarios" do
    run_cases(
      "empty state and failed removal" => lambda do |case_name|
        expect(queue.empty?).to be(true),
                                "#{case_name}: Queue should be empty after initialization"
        expect(queue.size).to eq(empty_size),
                              "#{case_name}: Queue should have size #{empty_size} after initialization"
        expect(queue.peek).to eq(failure_indicator),
                              "#{case_name}: Queue should return the failure indicator when peeking empty"
        expect(queue.dequeue).to eq(failure_indicator),
                                 "#{case_name}: Queue should return the failure indicator when dequeuing empty"
      end,
      "FIFO and non-mutating peek" => lambda do |case_name|
        queue.enqueue(first_value)
        queue.enqueue(second_value)
        queue.enqueue(third_value)

        expect(queue.peek).to eq(first_value),
                              "#{case_name}: Queue should peek at its first enqueued value"
        expect(queue.size).to eq(filled_size),
                              "#{case_name}: Queue peek should not change its size"
      end,
      "removal and reuse" => lambda do |case_name|
        expect(queue.dequeue).to eq(first_value),
                                 "#{case_name}: Queue should dequeue its first value first"
        queue.enqueue(replacement_value)

        expect(queue.dequeue).to eq(second_value),
                                 "#{case_name}: Queue should preserve FIFO order after reuse"
        expect(queue.dequeue).to eq(third_value),
                                 "#{case_name}: Queue should dequeue its third value next"
        expect(queue.dequeue).to eq(replacement_value),
                                 "#{case_name}: Queue should dequeue the value enqueued after reuse last"
        expect(queue.empty?).to be(true),
                                "#{case_name}: Queue should be empty after all values are dequeued"
        expect(queue.size).to eq(empty_size),
                              "#{case_name}: Queue should have size #{empty_size} when empty"
      end,
      "empty after removal" => lambda do |case_name|
        expect(queue.dequeue).to eq(failure_indicator),
                                 "#{case_name}: Queue should return the failure indicator after being emptied"
        expect(queue.empty?).to be(true),
                                "#{case_name}: Queue should remain empty after a failed dequeue"
      end
    )
  end
end
