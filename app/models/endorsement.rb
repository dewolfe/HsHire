class Endorsement < ActiveRecord::Base
  belongs_to :skill, dependent: :destroy
  belongs_to :user

  def is_user_unique?
    self.skill.endorsements.collect{ |e| e.user_id==user_id }.include?(true) ? false:true
  end

  def self.get_ratio(skill)
    a=(Endorsement.all.size.to_f)/(Skill.all.size.to_f)
    s=skill.endorsements.size.to_f
    p=(s/a)*100
    p.to_i
  end
end
