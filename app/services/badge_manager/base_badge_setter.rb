module BadgeManager
  class BaseBadgeSetter
    def initialize(result, badge)
      @result = result
      @user = result.user
      @test = result.test
      @badge = badge
    end

    def successful_results
      if @user.badges.include?(@badge)
        @user.results.select do |result|
          result.status && result.created_at > @user.badges_users.where(badge_id: @badge.id).last.created_at
        end
      else
        @user.results.select(&:status)
      end
    end
  end
end
