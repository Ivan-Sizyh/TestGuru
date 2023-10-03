module Badges
  class FirstTryRuleSpecification < Base
    def satisfied?
      (results_by_tests_count == 1) && @badge.criterion == @test.id.to_s
    end

    private

    def results_by_tests_count
      successful_results.select { |result| result.test_id == @test.id }.count
    end
  end
end