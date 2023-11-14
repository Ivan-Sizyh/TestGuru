class BadgesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_badges = current_user.preload(:badges)
    @remaining_badges = Badge.all - @user_badges.uniq
  end
end
