module TestsHelper

  TEST_LEVELS = { 0..1 => 'легкий', 2..4 => 'средний',
                  5..Float::INFINITY => 'сложный' }.freeze

  def test_level(test)
    TEST_LEVELS.select { |level| level == test.level }.values.first || 'Очень сложный'
  end
end
