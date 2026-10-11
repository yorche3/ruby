# frozen_string_literal: true

RSpec.describe DataStructuresBasics::LinkedList do
  let(:list) { described_class.new }
  let(:empty_size) { 0 }
  let(:first_tail_value) { 10 }
  let(:second_tail_value) { 20 }
  let(:head_value) { 5 }
  let(:missing_value) { 99 }
  let(:failure_indicator) { -1 }
  let(:inserted_size) { 4 }
  let(:size_after_first_delete) { 3 }

  def run_cases(cases)
    cases.each do |case_name, assertion|
      assertion.call(case_name)
    end
  end

  it "executes the linked-list scenarios" do
    run_cases(
      "empty state" => lambda do |case_name|
        expect(list.empty?).to be(true),
                               "#{case_name}: LinkedList should be empty after initialization"
        expect(list.size).to eq(empty_size),
                             "#{case_name}: LinkedList should have size #{empty_size} after initialization"
        expect(list.head).to eq(failure_indicator),
                             "#{case_name}: LinkedList should return the failure indicator when empty"
      end,
      "insert at both ends" => lambda do |case_name|
        list.insert_tail(first_tail_value)
        list.insert_tail(second_tail_value)
        list.insert_head(head_value)
        list.insert_tail(first_tail_value)

        expect(list.size).to eq(inserted_size),
                             "#{case_name}: LinkedList should contain all inserted values"
        expect(list.head).to eq(head_value),
                             "#{case_name}: LinkedList should expose the value inserted at its head"
      end,
      "delete first occurrence" => lambda do |case_name|
        expect(list.delete(first_tail_value)).to be(true),
                                               "#{case_name}: LinkedList should delete the first matching value"
        expect(list.size).to eq(size_after_first_delete),
                             "#{case_name}: LinkedList should decrease its size after deletion"
        expect(list.head).to eq(head_value),
                             "#{case_name}: LinkedList should preserve its head after deleting a later value"
      end,
      "absent value" => lambda do |case_name|
        expect(list.delete(missing_value)).to be(false),
                                            "#{case_name}: LinkedList should report a missing value"
        expect(list.size).to eq(size_after_first_delete),
                             "#{case_name}: LinkedList should preserve its size for a missing value"
        expect(list.head).to eq(head_value),
                             "#{case_name}: LinkedList should preserve its contents for a missing value"
      end,
      "empty the list" => lambda do |case_name|
        expect(list.delete(head_value)).to be(true),
                                         "#{case_name}: LinkedList should delete its head"
        expect(list.head).to eq(second_tail_value),
                             "#{case_name}: LinkedList should preserve insertion order after deleting its head"
        expect(list.delete(second_tail_value)).to be(true),
                                                "#{case_name}: LinkedList should delete the next value"
        expect(list.head).to eq(first_tail_value),
                             "#{case_name}: LinkedList should retain the remaining tail value"
        expect(list.delete(first_tail_value)).to be(true),
                                               "#{case_name}: LinkedList should delete its final value"
        expect(list.empty?).to be(true),
                               "#{case_name}: LinkedList should be empty after deleting every value"
        expect(list.size).to eq(empty_size),
                             "#{case_name}: LinkedList should have size #{empty_size} when empty"
        expect(list.head).to eq(failure_indicator),
                             "#{case_name}: LinkedList should return the failure indicator when emptied"
      end
    )
  end
end
