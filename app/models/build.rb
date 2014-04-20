class Build < ActiveRecord::Base
  include AASM

  belongs_to :repository
  has_many :klasses, dependent: :destroy

  aasm do
    state :scheduled, initial: true
    state :running,   enter: :analyze
    state :completed

    event :run do
      transitions from: :scheduled, to: :running
    end

    event :complete do
      transitions from: :running, to: :completed
    end
  end

  def analyze
    processor = Processor.new
    processor.process repository.clone_url

    self.klasses = processor.class_details.map do |detail|
      Klass.new(detail)
    end
    complete!
  end
  handle_asynchronously :analyze
end