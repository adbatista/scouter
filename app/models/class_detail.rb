class ClassDetail < ActiveRecord::Base
  belongs_to :repository
  validates_presence_of :class_name, :score

  def to_s
    class_name
  end

  def grade
    case method_average
    when 0...10.1
      :great
    when 10.1...20.1
      :good
    when 20.1...40.1
      :normal
    when 40.1...60.1
      :poor
    when 60.1...100.1
      :bad
    when 100.1..200
      :terrible
    else
      :crap
    end
  end
end