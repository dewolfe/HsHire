class Profile < ActiveRecord::Base
  attr_accessible :avatar,:description,:skills_attributes,:tag_line,:kids,:resume,:web_site
  mount_uploader :avatar, AvatarUploader
  mount_uploader :resume, ResumeUploader
  serialize :kids


  belongs_to :user
  has_many :skills
  accepts_nested_attributes_for :skills


end

