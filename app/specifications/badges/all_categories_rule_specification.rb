module Badges

  class AllCategoriesRuleSpecification
    def satisfied?
      @test.category_id.to_s == @badge.criterion && tests_titles_by_category == all_tests_titles
    end

    private

    def all_tests_titles
      Test.tests_by_category_titles(@test.category.title)
    end

    def tests_titles_by_category
      successful_results.select { |result| result.test.category_id == @test.category_id }
                        .map { |result| result.test.title }
                        .uniq
                        .sort
                        .reverse!
    end
  end
end