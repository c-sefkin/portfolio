class Project < ActiveRecord::Base
  has_many :skills
  validates :name, :presence => true
  validates :description, :presence => true
  validates :github, :presence => true
end
