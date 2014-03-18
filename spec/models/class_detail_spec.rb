require 'spec_helper'

describe ClassDetail do
  it "have a class name" do
    class_detail = build(:class_detail, class_name: nil)

    expect(class_detail).to_not be_valid
  end

  it "have a score" do
    class_detail = build(:class_detail, score: nil)

    expect(class_detail).to_not be_valid
  end
end