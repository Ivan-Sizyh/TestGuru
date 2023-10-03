module Badges
  class AllLevelRuleSpecification < Base
    def satisfies?
      successful_results_tests.any? && (@badge.criterion == @test.level.to_s) &&
        (successful_results_tests == Test.where(level: @test.level))
    end

    private

    def successful_results_tests
      successful_results.select { |result| result.test.level == @test.level }
                        .map { |result| result.test }
                        .uniq
                        .sort
    end
  end
end