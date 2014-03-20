require 'git'
require 'fileutils'

class RepositoryHandler
  def initialize git=Git, file_handler=FileUtils
    @git = git
    @file_handler = file_handler
  end

  def create_repository repository
    name = Time.now.to_i.to_s
    path = Rails.root.join 'tmp','repos'

    @git.clone repository, name, path: "#{path}"
    path.join name
  end

  def destroy_repository path
    @file_handler.remove_dir path, force: true
  end
end