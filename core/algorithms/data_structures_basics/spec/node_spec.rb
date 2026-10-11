# frozen_string_literal: true

RSpec.describe DataStructuresBasics::Node do
  let(:first_value) { 10 }
  let(:second_value) { 20 }
  let(:first_node) { described_class.new(first_value) }
  let(:second_node) { described_class.new(second_value) }
  let(:native_absence) { nil }

  def run_cases(cases)
    cases.each do |case_name, assertion|
      assertion.call(case_name)
    end
  end

  it "observes initialized and linked nodes" do
    run_cases(
      "initialize and observe value/link" => lambda do |case_name|
        expect(first_node.value).to eq(first_value),
                                    "#{case_name}: Node should expose its initialized value"
        expect(first_node.next).to eq(native_absence),
                                  "#{case_name}: Node should have no next link after initialization"
      end,
      "initialize another node, link, and traverse" => lambda do |case_name|
        first_node.next = second_node

        expect(first_node.next.value).to eq(second_value),
                                         "#{case_name}: Node should traverse to the linked value"
        expect(second_node.next).to eq(native_absence),
                                   "#{case_name}: linked Node should retain its absent next link"
      end
    )
  end
end
