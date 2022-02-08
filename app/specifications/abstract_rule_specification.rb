class AbstractRuleSpecification
  def initialize(badge, result)
    @badge = badge
    @result = result
    @test = @result.test
  end

  def satisfied?
    raise "#{__method__} undefined for #{self.class}"
  end
end