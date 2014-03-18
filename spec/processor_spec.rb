require 'spec_helper'

describe Processor do
  let(:flog){ double("Flog").as_null_object }
  let(:repo){'path/example.git' }
  subject{ Processor.new flog }
  let(:file){ 'spec/support_files/example.rb' }

  describe "#class_details" do
    it "return class name and respective score" do
      allow(flog).to receive(:scores).and_return({'Test' => 10.7 })

      expect(subject.class_details).to include({ class_name: 'Test', score:  10.7 })
    end
  end

  describe "#process" do
    before do
      allow(subject).to receive(:create_repository)
    end

    it "process repository" do
      expect(flog).to receive(:flog)

      subject.process repo
    end

    it "calculate score" do
      expect(flog).to receive(:calculate)

      subject.process repo
    end
  end
end