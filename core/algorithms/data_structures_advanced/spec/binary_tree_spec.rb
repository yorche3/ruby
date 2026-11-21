# frozen_string_literal: true

require "data_structures_advanced"

RSpec.describe DataStructuresAdvanced::BinaryTree do
  let(:tree) { described_class.new }
  let(:root_value) { 50 }
  let(:lower_value) { 30 }
  let(:higher_value) { 70 }
  let(:lowest_value) { 20 }
  let(:middle_value) { 40 }
  let(:missing_value) { 99 }
  let(:success) { true }
  let(:failure) { false }

  def insert_all(values, case_name)
    values.each do |value|
      expect(tree.insert(value)).to eq(success),
                                    "#{case_name}: BinaryTree should succeed when inserting #{value}"
    end
  end

  def expect_members(values, case_name)
    values.each do |value|
      expect(tree.contains?(value)).to eq(success),
                                       "#{case_name}: BinaryTree should contain #{value}"
    end
  end

  it "Create empty" do
    case_name = "Create empty"

    expect(tree.empty?).to be(true), "#{case_name}: BinaryTree should be empty after initialization"
    expect(tree.size).to eq(0), "#{case_name}: BinaryTree should have size 0 after initialization"
    expect(tree.contains?(root_value)).to eq(failure),
                                          "#{case_name}: BinaryTree should fail to contain #{root_value} when empty"
  end

  it "Insert the root" do
    case_name = "Insert the root"

    insert_all([root_value], case_name)

    expect(tree.size).to eq(1), "#{case_name}: BinaryTree should have size 1"
    expect(tree.empty?).to be(false), "#{case_name}: BinaryTree should not be empty"
    expect_members([root_value], case_name)
  end

  it "Insert lower and higher" do
    case_name = "Insert lower and higher"
    values = [root_value, lower_value, higher_value]

    insert_all(values, case_name)

    expect(tree.size).to eq(3), "#{case_name}: BinaryTree should have size 3"
    expect_members(values, case_name)
  end

  it "Multilevel branches" do
    case_name = "Multilevel branches"
    values = [root_value, lower_value, higher_value, lowest_value, middle_value]

    insert_all(values, case_name)

    expect_members(values, case_name)
    expect(tree.size).to eq(5), "#{case_name}: BinaryTree should have size 5"
  end

  it "Missing value in nonempty tree" do
    case_name = "Missing value in nonempty tree"

    insert_all([root_value], case_name)

    expect(tree.contains?(missing_value)).to eq(failure),
                                             "#{case_name}: BinaryTree should fail to contain #{missing_value}"
    expect(tree.size).to eq(1), "#{case_name}: BinaryTree should keep size 1 after a failed lookup"
    expect_members([root_value], case_name)
  end

  it "Idempotent duplicate" do
    case_name = "Idempotent duplicate"

    insert_all([root_value, lower_value, higher_value, lower_value], case_name)

    expect(tree.size).to eq(3), "#{case_name}: BinaryTree should not grow when inserting a duplicate"
    expect_members([root_value, lower_value, higher_value], case_name)
  end

  it "Ordered insertions" do
    case_name = "Ordered insertions"
    values = [lowest_value, lower_value, middle_value, root_value, higher_value]

    insert_all(values, case_name)

    expect(tree.size).to eq(5), "#{case_name}: BinaryTree should have size 5"
    expect_members(values, case_name)
    expect(tree.contains?(missing_value)).to eq(failure),
                                             "#{case_name}: BinaryTree should fail to contain #{missing_value}"
  end
end
