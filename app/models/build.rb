class Build < ActiveRecord::Base
  belongs_to :repository
  has_many :klasses, dependent: :destroy
end