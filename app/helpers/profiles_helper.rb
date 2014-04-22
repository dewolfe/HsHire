module ProfilesHelper
  def button_color(level)
    case level
      when 1
        return "success round label"
      when 2
        return "secondary round label"
      when 3
        return "round label"
      else
        return "round label"
    end
  end
end
