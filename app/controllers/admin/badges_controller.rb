class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[show edit update destroy]

  def index
    @badges = Badge.includes(:badges_users).all
  end

  def show
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = BadgeCreatorService.new(badge_params).create_badge

    if @badge.save
      redirect_to admin_badge_path(@badge)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if BadgeUpdateService.new(badge_params).update_badge
      redirect_to admin_badge_path(@badge)
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:title, :description, :image, :event, :criterion)
  end
end
