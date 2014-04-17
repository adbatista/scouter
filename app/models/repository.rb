class Repository < ActiveRecord::Base
  has_many :builds, dependent: :destroy

  validates_uniqueness_of :name, message: "This repository already exists"
  validates_format_of :name, with: %r{[\w-]+/[\w-]+}

  delegate :klasses, to: :current_build

  def clone_url
    "https://github.com/#{name}.git"
  end

  def current_build
    builds.last
  end
end
