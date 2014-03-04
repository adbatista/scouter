require 'spec_helper'

describe Processor do
  let(:repo){'path/example.git'}
  subject {Processor.new repo}

  describe "#analyze_complexity" do
    let(:file) { 'spec/support_files/example.rb' }
    it "get score" do
      subject.analyze_complexity file

      expect(subject.complexity_score).to be_within(0.1).of(10.7)
    end
  end

  describe "#process" do
    it "process repository" do
      allow(subject).to receive(:create_repository)
      
      expect(subject).to receive(:analyze_complexity)

      subject.process
    end
  end
  
  it "get required attributes for repository" do
    allow(subject).to receive(:create_repository)

    subject.process

    expect(subject.data).to include(:url,:score)
  end
end