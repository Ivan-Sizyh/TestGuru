class BadgesService
  def initialize(result)
    @result = result
    @user = result.user
    @test = result.test
  end

  def call
    check_badges
    @badges.each do |badge|
      @user.badges.push(badge)
    end
  end

  private

  def check_badges
    all_badges = Badge.all

    @badges = []

    all_badges.each do |badge|
      case badge.event
      when 'first_try?'
        first_try?(badge)
      when 'all_tests_category?'
        all_tests_category?(badge)
      when 'all_tests_level?'
        all_tests_level?(badge)
      when 'all_tests?'
        all_tests?(badge)
      end
    end
  end

  def first_try?(badge)
    if (@user.results_by_test(@test).count == 1) && badge.criterion == @test.title
      @badges.push(badge)
    end
  end

  def all_tests_level?(badge)
    tests_by_level = @user.successful_tests_by_level(@test.level)
    if tests_by_level.present? && badge.criterion == @test.level.to_s && (tests_by_level == Test.where(level: @test.level))
      @badges.push(badge)
    end
  end

  def all_tests_category?(badge)
    if badge.criterion == @test.category.title &&
      @user.results_by_category(@test.category) == Test.tests_by_category_titles(@test.category.title)
      @badges.push(badge)
    end
  end

  def all_tests?(badge)
    if @user.successful_results == Test.all
      @badges.push(badge)
    end
  end
end