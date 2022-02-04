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
        badge_set_time = @user.badges_users.where(badge_id: @badge.id).last.created_at

        @user.results.select { |result| result.status && result.created_at > badge_set_time }
      else
        @user.results.select(&:status)
      end
    end
  end
end
