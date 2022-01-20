class Admin::TestsController < Admin::BaseController
  before_action :find_test, only: %i[edit update destroy show start]

  def index
    @tests = Test.all
  end

  def show
  end

  def new
    @test = current_user.authored_tests.new
  end

  def create
    @test = current_user.authored_tests.create(test_params)
    if @test.save
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
