module BadgeManager
  class CategoryBadgeSetter < BaseBadgeSetter
    def call
      if @test.category_id.to_s == @badge.criterion && tests_titles_by_category == Test.tests_by_category_titles(@test.category.title)
        @user.badges.push(@badge)
      end
    end

    private

    def tests_titles_by_category
      successful_results.select { |result| result.test.category_id == @test.category_id }
                        .map { |result| result.test.title }
                        .uniq
                        .sort
                        .reverse!
    end
  end
end
