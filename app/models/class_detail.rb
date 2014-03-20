class ClassDetail < ActiveRecord::Base
  belongs_to :repository
  validates_presence_of :class_name, :score

  def to_s
    "%.2f - %s" % [ score, class_name ]
  end
end
