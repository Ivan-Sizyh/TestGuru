class BadgesService
  def initialize(result)
    @result = result
  end

  RULES = {
    Badge::events['first_try'] => BadgeManager::FirstTryBadgeSetter,
    Badge::events['all_tests_category'] => BadgeManager::CategoryBadgeSetter,
    Badge::events['all_tests_level'] => BadgeManager::LevelBadgeSetter
  }.freeze

  def call
    Badge.find_each do |badge|
      RULES[badge.event.to_i].new(@result, badge).call
    end
  end
end
