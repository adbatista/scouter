class Repository < ActiveRecord::Base
  has_many :builds, dependent: :destroy

  validates_uniqueness_of :name, message: "This repository already exists"
  validates_format_of :name, with: %r{[\w-]+/[\w-]+}

  def klasses
    current_build.try(:klasses) || []
  end

  def clone_url
    "https://github.com/#{name}.git"
  end

  def current_build
    builds.last
  end
end
