require_relative "./spec_helper"

describe FileTree do
  before do
    @ft = FileTree.new("/tmp/")
  end

  it "returns a FileTree object after join" do
    @ft.join("text.txt").class.to_s.must_match /FileTree/
  end
end
