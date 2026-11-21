# frozen_string_literal: true

require "data_structures_advanced"

RSpec.describe DataStructuresAdvanced::TreeNode do
  let(:parent_value) { 10 }
  let(:left_value) { 20 }
  let(:right_value) { 30 }
  let(:parent) { described_class.new(parent_value) }
  let(:left_child) { described_class.new(left_value) }
  let(:right_child) { described_class.new(right_value) }
  let(:absent) { nil }

  it "Create a tree node" do
    expect(parent.value).to eq(parent_value),
                            "Create a tree node: TreeNode should keep value #{parent_value}"
  end

  it "Absent initial links" do
    expect(parent.left).to eq(absent),
                           "Absent initial links: TreeNode should start with an absent left link"
    expect(parent.right).to eq(absent),
                            "Absent initial links: TreeNode should start with an absent right link"
  end

  it "Link two children" do
    parent.left = left_child
    parent.right = right_child

    expect(parent.left&.value).to eq(left_value),
                                 "Link two children: TreeNode should expose left child value #{left_value}"
    expect(parent.right&.value).to eq(right_value),
                                  "Link two children: TreeNode should expose right child value #{right_value}"
  end

  it "Traverse each link" do
    parent.left = left_child
    parent.right = right_child

    expect(parent.left&.value).to eq(left_value),
                                 "Traverse each link: TreeNode should lead to #{left_value} through left"
    expect(parent.right&.value).to eq(right_value),
                                  "Traverse each link: TreeNode should lead to #{right_value} through right"
    expect(parent.left&.left).to eq(absent),
                                "Traverse each link: left child should have an absent left link"
    expect(parent.left&.right).to eq(absent),
                                 "Traverse each link: left child should have an absent right link"
    expect(parent.right&.left).to eq(absent),
                                 "Traverse each link: right child should have an absent left link"
    expect(parent.right&.right).to eq(absent),
                                  "Traverse each link: right child should have an absent right link"
  end

  it "Unlink children" do
    parent.left = left_child
    parent.right = right_child

    parent.left = absent
    expect(parent.left).to eq(absent),
                           "Unlink children: TreeNode should have an absent left link after clearing it"
    expect(parent.value).to eq(parent_value),
                            "Unlink children: TreeNode should keep its value after clearing left"
    expect(parent.right&.value).to eq(right_value),
                                  "Unlink children: TreeNode should keep its right child after clearing left"

    parent.right = absent
    expect(parent.left).to eq(absent),
                           "Unlink children: TreeNode should have an absent left link after clearing both"
    expect(parent.right).to eq(absent),
                            "Unlink children: TreeNode should have an absent right link after clearing both"
    expect(parent.value).to eq(parent_value),
                            "Unlink children: TreeNode should keep its value after clearing both"
  end
end
