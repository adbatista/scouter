class Repository < ActiveRecord::Base
  validates_uniqueness_of :url, message: "This repository already exists"
  has_many :class_details, dependent: :destroy

  def name
    url.gsub(%r{(https://github.com/|\.git)},'')
  end
end
