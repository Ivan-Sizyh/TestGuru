class Admin < User
  has_many :authored_tests, class_name: 'Test', foreign_key: 'author_id', inverse_of: 'author'
end
