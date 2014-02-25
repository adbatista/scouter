require 'spec_helper'

describe Processor do
  let(:repo){Rails.root.join('tmp','test','example.git')}
  subject {Processor.new repo}
  
  before do
    subject.process
  end

  it "get a repository score" do
    expect(subject.score).to eq(1.0)
  end

  it "get required attributes for repository" do
    expect(subject.data).to include(:url,:score)
  end


end