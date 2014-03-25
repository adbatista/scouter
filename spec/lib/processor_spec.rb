require 'spec_helper'

describe Processor do
  let(:metric) { double("MetricFu").as_null_object }
  let(:repository_handler) { double("RepositoryHandler").as_null_object }
  subject { Processor.new metric, repository_handler }

  describe "#class_details" do
    it "return complexity metrics" do
      metric_result = { flog: { :method_containers=>[ { name: "Test", total_score: 10.7 } ] }}
      allow(metric).to receive(:result).and_return(metric_result)

      expect(subject.class_details).to include({ class_name: 'Test', score:  10.7 })
    end
  end

  describe "#process" do
    let(:repo) {'path/example.git' }

    before do
      allow(repository_handler).to receive(:create_repository).and_return("tmp/repos")
    end

    it "process repository" do
      expect(metric).to receive(:run_only).with(%w{ flog })

      subject.process repo
    end
  end
end