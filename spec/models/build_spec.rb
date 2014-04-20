require 'spec_helper'
describe Build do
  subject { create(:build) }
  describe "#run!" do
    it "be running" do
      subject.run!
      expect(subject).to be_running
    end

    it "call #analyze" do
      expect(subject).to receive(:analyze);
      subject.run!
    end
  end
end