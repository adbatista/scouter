class Repository < ActiveRecord::Base
  validates_uniqueness_of :url, message: "This repository already exists"
  has_many :method_details
end
