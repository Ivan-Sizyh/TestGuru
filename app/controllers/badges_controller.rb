class BadgesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_badges = @user_badges = current_user.badges.includes(:badges_users)
    @remaining_badges = Badge.includes(:badges_users).all - @user_badges.uniq
  end
end
