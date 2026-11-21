# frozen_string_literal: true

require "data_structures_advanced"

RSpec.describe DataStructuresAdvanced::Graph do
  let(:graph) { described_class.new }
  let(:label_ten) { 10 }
  let(:label_thirty) { 30 }
  let(:label_fifty) { 50 }
  let(:label_seventy) { 70 }
  let(:missing_label) { 99 }
  let(:other_missing_label) { 98 }
  let(:success) { true }
  let(:failure) { false }
  let(:missing_neighbors) { nil }

  def add_vertices(labels, case_name)
    labels.each do |label|
      expect(graph.add_vertex(label)).to eq(success),
                                         "#{case_name}: Graph should succeed when adding vertex #{label}"
    end
  end

  def add_edges(edges, case_name)
    edges.each do |from, to|
      expect(graph.add_edge(from, to)).to eq(success),
                                          "#{case_name}: Graph should succeed when adding edge (#{from}, #{to})"
    end
  end

  def expect_counts(vertices, edges, case_name)
    expect(graph.vertex_count).to eq(vertices),
                                  "#{case_name}: Graph should have #{vertices} vertices"
    expect(graph.edge_count).to eq(edges),
                                "#{case_name}: Graph should have #{edges} edges"
  end

  def expect_neighbors(label, expected, case_name)
    expect(graph.neighbors(label)).to eq(expected),
                                      "#{case_name}: Graph should report neighbors #{expected} for #{label}"
  end

  it "Create empty" do
    case_name = "Create empty"

    expect(graph.empty?).to be(true), "#{case_name}: Graph should be empty after initialization"
    expect_counts(0, 0, case_name)
    expect(graph.has_edge?(label_ten, label_thirty)).to eq(failure),
                                                        "#{case_name}: Graph should fail has_edge? when empty"
    expect(graph.neighbors(label_ten)).to eq(missing_neighbors),
                                          "#{case_name}: Graph should fail neighbors when empty"
  end

  it "Isolated vertex" do
    case_name = "Isolated vertex"

    add_vertices([label_ten], case_name)

    expect(graph.empty?).to be(false), "#{case_name}: Graph should not be empty"
    expect_counts(1, 0, case_name)
    expect_neighbors(label_ten, [], case_name)
  end

  it "Nonconsecutive labels and directed edge" do
    case_name = "Nonconsecutive labels and directed edge"

    add_vertices([label_ten, label_seventy], case_name)
    add_edges([[label_ten, label_seventy]], case_name)

    expect(graph.has_edge?(label_ten, label_seventy)).to eq(success),
                                                         "#{case_name}: Graph should have the forward edge"
    expect(graph.has_edge?(label_seventy, label_ten)).to eq(failure),
                                                         "#{case_name}: Graph should not have the reverse edge"
    expect_counts(2, 1, case_name)
  end

  it "Duplicate vertex preserves adjacency" do
    case_name = "Duplicate vertex preserves adjacency"

    add_vertices([label_ten, label_thirty], case_name)
    add_edges([[label_ten, label_thirty]], case_name)
    add_vertices([label_ten], case_name)

    expect_counts(2, 1, case_name)
    expect_neighbors(label_ten, [label_thirty], case_name)
  end

  it "Duplicate edge" do
    case_name = "Duplicate edge"

    add_vertices([label_ten, label_thirty], case_name)
    add_edges([[label_ten, label_thirty], [label_ten, label_thirty]], case_name)

    expect_counts(2, 1, case_name)
    expect_neighbors(label_ten, [label_thirty], case_name)
  end

  it "Missing endpoint without mutation" do
    case_name = "Missing endpoint without mutation"
    rejected_edges = [
      [label_ten, missing_label],
      [missing_label, label_ten],
      [other_missing_label, missing_label],
      [missing_label, missing_label]
    ]

    add_vertices([label_ten, label_thirty], case_name)
    add_edges([[label_ten, label_thirty]], case_name)
    rejected_edges.each do |from, to|
      expect(graph.add_edge(from, to)).to eq(failure),
                                          "#{case_name}: Graph should fail adding edge (#{from}, #{to})"
    end

    expect_counts(2, 1, case_name)
    expect_neighbors(label_ten, [label_thirty], case_name)
    expect_neighbors(label_thirty, [], case_name)
    rejected_edges.each do |from, to|
      expect(graph.has_edge?(from, to)).to eq(failure),
                                           "#{case_name}: Graph should not have rejected edge (#{from}, #{to})"
    end
    [other_missing_label, missing_label].each do |label|
      expect(graph.neighbors(label)).to eq(missing_neighbors),
                                        "#{case_name}: Graph should fail neighbors for missing vertex #{label}"
    end
  end

  it "Sorted neighbours and counts" do
    case_name = "Sorted neighbours and counts"

    add_vertices([label_ten, label_thirty, label_fifty, label_seventy], case_name)
    add_edges(
      [[label_ten, label_seventy], [label_ten, label_thirty], [label_ten, label_fifty], [label_thirty, label_fifty]],
      case_name
    )

    expect_neighbors(label_ten, [label_thirty, label_fifty, label_seventy], case_name)
    expect_neighbors(label_thirty, [label_fifty], case_name)
    expect_neighbors(label_fifty, [], case_name)
    expect_neighbors(label_seventy, [], case_name)
    expect_counts(4, 4, case_name)
  end

  it "Missing-edge query" do
    case_name = "Missing-edge query"

    add_vertices([label_ten, label_thirty], case_name)

    expect(graph.has_edge?(label_ten, label_thirty)).to eq(failure),
                                                        "#{case_name}: Graph should fail has_edge? without the edge"
    expect_counts(2, 0, case_name)
    expect(graph.empty?).to be(false), "#{case_name}: Graph should not be empty"
  end

  it "Neighbours of missing vertex" do
    case_name = "Neighbours of missing vertex"

    add_vertices([label_ten], case_name)

    expect(graph.neighbors(missing_label)).to eq(missing_neighbors),
                                              "#{case_name}: Graph should fail neighbors for a missing vertex"
    expect(graph.neighbors(label_ten)).not_to eq(graph.neighbors(missing_label)),
                                              "#{case_name}: Graph should distinguish failure from empty neighbors"
    expect_counts(1, 0, case_name)
  end

  it "Self-loop and duplicate" do
    case_name = "Self-loop and duplicate"

    add_vertices([label_ten], case_name)
    add_edges([[label_ten, label_ten], [label_ten, label_ten]], case_name)

    expect(graph.has_edge?(label_ten, label_ten)).to eq(success),
                                                     "#{case_name}: Graph should have the self-loop"
    expect_neighbors(label_ten, [label_ten], case_name)
    expect_counts(1, 1, case_name)
  end

  it "Neighbour-result isolation" do
    case_name = "Neighbour-result isolation"

    add_vertices([label_ten, label_thirty, label_fifty], case_name)
    add_edges([[label_ten, label_thirty]], case_name)
    saved = graph.neighbors(label_ten)
    copy = graph.neighbors(label_ten)
    copy << missing_label unless copy.frozen?
    add_edges([[label_ten, label_fifty]], case_name)

    expect(saved).to eq([label_thirty]),
                     "#{case_name}: Graph should keep the saved neighbors unchanged"
    expect_neighbors(label_ten, [label_thirty, label_fifty], case_name)
    expect_counts(3, 2, case_name)
  end
end
