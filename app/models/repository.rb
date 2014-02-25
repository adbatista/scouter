class Repository < ActiveRecord::Base
  validates_uniqueness_of :url, message: "This repository already exists"
end
