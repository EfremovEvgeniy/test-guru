module BadgesHelper
  def rule_types
    Badge::RULES.map { |rule| [t(".#{rule}"), rule] }
  end
end
