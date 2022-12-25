require_relative 'spec_helper'

RSpec.describe GameMatrix, "#Game Matrix" do
  context "when the matrix is created" do
    it "has the correct height" do
      g = GameMatrix.new(3, 2)
      expect(g.height).to eq(3)
    end

    it "has the correct width" do
      g = GameMatrix.new(2, 5)
      expect(g.width).to eq(5)
    end
  end

  context "when the matrix is updated" do
    it "displays the updated matrix" do
      g = GameMatrix.new(2, 2)
      expect(g.array[0][0]).to eq(0)
      g.update_matrix(1, 1, 1, 1, "X")
      expect(g.array[0][0]).to eq("X")
    end
  end
end