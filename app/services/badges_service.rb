class BadgesService
  RULES = {
    Badge::events['first_try'] => Badge::FirstTryRuleSpecification,
    Badge::events['all_tests_category'] => Badge::AllCategoriesRuleSpecification,
    Badge::events['all_tests_level'] => Badge::AllLevelRuleSpecification
  }.freeze

  def initialize(result)
    @result = result
  end

  def call
    Badge.find_each do |badge|
      rule = RULES[badge.event.to_i].new(badge, @result)
      add_badge(badge) if rule.satisfies?
    end
  end

  private

  def add_badge(badge)
    @result.user.badges.push(badge)
  end
end
