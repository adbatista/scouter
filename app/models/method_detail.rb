class MethodDetail < ActiveRecord::Base
  belongs_to :repository

  def to_s
    detail
  end
end
