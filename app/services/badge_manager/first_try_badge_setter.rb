module BadgeManager
  class FirstTryBadgeSetter < BaseBadgeSetter
    def call
      if (results_by_tests_count == 1) && @badge.criterion == @test.id.to_s
        @user.badges.push(@badge)
      end
    end

    private

    def results_by_tests_count
      successful_results.select { |result| result.test_id == @test.id }.count
    end
  end
end
