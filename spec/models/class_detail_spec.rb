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

  describe "#grade" do
    it "return great for a complexity/method <= 10.0" do
      class_detail = build(:class_detail, method_average: 6.5)
      expect(class_detail.grade).to be(:great)
    end

    it "return good for a complexity/method <= 20.0" do
      class_detail = build(:class_detail, method_average: 11.5)
      expect(class_detail.grade).to be(:good)
    end

    it "return normal for a complexity/method <= 40.0" do
      class_detail = build(:class_detail, method_average: 21.5)
      expect(class_detail.grade).to be(:normal)
    end

    it "return poor for a complexity/method <= 60.0" do
      class_detail = build(:class_detail, method_average: 41.5)
      expect(class_detail.grade).to be(:poor)
    end

    it "return bad for a complexity/method <= 100.0" do
      class_detail = build(:class_detail, method_average: 60.5)
      expect(class_detail.grade).to be(:bad)
    end

    it "return terrible for a complexity/method <= 200.0" do
      class_detail = build(:class_detail, method_average: 101.5)
      expect(class_detail.grade).to be(:terrible)
    end

    it "return crap for a complexity/method > 200.0" do
      class_detail = build(:class_detail, method_average: 201.0)
      expect(class_detail.grade).to be(:crap)
    end
  end
end