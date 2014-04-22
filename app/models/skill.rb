class Skill < ActiveRecord::Base
  attr_accessible :name,:cat,:months,:profile_id
  validates :name, :presence => true
  belongs_to :profile
  has_many :endorsements
end
