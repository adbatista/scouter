class ClassDetail < ActiveRecord::Base
  belongs_to :repository

  def to_s
    "#{score} #{class_name}"
  end
end
