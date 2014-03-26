class ClassDetail < ActiveRecord::Base
  belongs_to :repository
  validates_presence_of :class_name, :score

  def to_s
    "#{formated_score} - #{class_name}"
  end

  def formated_score
    "%.2f" % score
  end
end
