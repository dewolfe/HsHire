module SkillsHelper
  def set_skill_color(skill)
    a=(Endorsement.all.size.to_f)/(Skill.all.size.to_f)
    s=skill.endorsements.size.to_f
    p=(s/a)*100
    case p
      when (0..25)
        return "#F1EEF6"
      when (26..50)
        return "#C2E699"
      when (51..75)
        return "#78C679"
      else
        return "#238443"
    end
  end
end
