class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[show edit update destroy]

  def index
    @badges = Badge.all
  end

  def show
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.create(badge_params)

    if @badge.save
      redirect_to admin_badge_path(@badge)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @badge.update(badge_params)
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
    if params[:badge][:event] == Badge::events['all_tests_category'].to_s
      params[:badge][:criterion] = Category.find_by(title: params[:badge][:criterion])&.id
    end

    if params[:badge][:event] == Badge::events['first_try'].to_s
      params[:badge][:criterion] = Test.find_by(title: params[:badge][:criterion])&.id
    end

    params.require(:badge).permit(:title, :description, :image, :event, :criterion)
  end
end
