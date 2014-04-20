class Repository < ActiveRecord::Base
  has_many :builds, dependent: :destroy

  validates_uniqueness_of :name, message: "This repository already exists"
  validates_format_of :name, with: %r{\A[\w-]+/[\w-]+\z}

  def create_build
    build = builds.new
    build.run! if build.save
  end

  def klasses
    current_build.try(:klasses) || []
  end

  def clone_url
    "https://github.com/#{name}.git"
  end

  def current_build
    self.builds.last
  end
end
