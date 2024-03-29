module Badges
  class Base

    def initialize(badge, result)
      @badge = badge
      @result = result
      @test = @result.test
    end

    def satisfies?
      raise "#{__method__} undefined for #{self.class}"
    end

    protected

    def successful_results
      user = @result.user

      if user.badges.include?(@badge)
        user.results.select do |result|
          result.status && result.created_at > user.badges_users.where(badge_id: @badge.id).last.created_at
        end
      else
        user.results.select(&:status)
      end
    end
  end
end