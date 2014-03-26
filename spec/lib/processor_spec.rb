require 'spec_helper'

describe Processor do
  let(:metric) { double("MetricFu").as_null_object }
  let(:repository_handler) { double("RepositoryHandler").as_null_object }
  subject { Processor.new metric, repository_handler }

  describe "#class_details" do
    before do
      method_containers = [{
        name: "Test",
        total_score: 10.7,
        average_score: 8.0,
        methods: {'some_method' => {}}
      }]
      metric_result = { flog: { method_containers: method_containers } }

      metric.stub_chain(:result, :result_hash).and_return(metric_result)
    end

    it { expect(subject.class_details.first).to include(class_name: 'Test') }

    it { expect(subject.class_details.first).to include(score: 10.7) }

    it { expect(subject.class_details.first).to include(method_count:1) }

    it { expect(subject.class_details.first).to include(method_average: 8.0) }
  end

  describe "#process" do
    let(:repo) {'path/example.git' }

    before do
      allow(repository_handler).to receive(:create_repository).and_return("tmp/repos")
    end

    it "process repository" do
      expect(metric).to receive(:run_only)

      subject.process repo
    end
  end
end