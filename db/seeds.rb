# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
                      {name: 'Иван', password: '1234567890', email: 'ivansizyh26@gmail.com'},
                      {name: 'Павел', password: '0987654321', email: 'pavel@gmail.com'}
                    ])
categories = Category([
                        {title: 'Математика'},
                        {title: 'Программирование'},
                        {title: 'Биология'},
                        {title: 'Литература'}
                      ])
tests = Test.create([
                     {title: 'Математика средней школы', level: 1, category: categories[0], author: users[0]},
                     {title: 'Автор и произведение', level: 0, category: categories[3], author: users[1]},
                   ])

questions = Question.create([
                              {body: 'Какой будет результат выражения 12 + 18 * 43?', test: tests[0]},
                              {body: 'Чему равно выражение 2^9?', test: tests[0]},
                              {body: 'Какая из формул для нахождения гипотенузы в треугольнике?', test: tests[0]},
                              {body: 'Если в квадратном уравнении дискриминант равен нулю, то количество корней равно...', test: tests[0]},
                              {body: 'Кто явдяется автором произведения \'Горе от ума\'?', test: tests[1]},
                              {body: 'Кто явдяется автором произведения \'Война и мир\'?', test: tests[1]},
                              {body: 'Какое из произведений принадлежит Н. В. Гоголю?', test: tests[1]},
                              {body: 'Какое из произведений принадлежит А. П. Гайдару?', test: tests[1]}
                            ])

answers = Answer.create([
                          {text: '1290', correct: true, question: questions[0]},
                          {text: '786', question: questions[0]},
                          {text: '2056', question: questions[0]},
                          {text: '1860', question: questions[0]},
                          {text: '64', question: questions[1]},
                          {text: '1024', question: questions[1]},
                          {text: '516', correct: true, question: questions[1]},
                          {text: '2048', question: questions[1]},
                          {text: 'C = sqrt(A^2 + B^2)', correct: true, question: questions[2]},
                          {text: 'C = sqrt(A^2 - B^2)', question: questions[2]},
                          {text: 'C = A + B', question: questions[2]},
                          {text: 'C = 4A - B', question: questions[2]},
                          {text: '0', question: questions[3]},
                          {text: '1', correct: true, question: questions[3]},
                          {text: '2', question: questions[3]},
                          {text: '3', question: questions[3]},
                          {text: 'Грибоедов', correct: true, question: questions[4]},
                          {text: 'Достоевсикй', question: questions[4]},
                          {text: 'Гоголь', question: questions[4]},
                          {text: 'Тургенев', question: questions[4]},
                          {text: 'Толстой', correct: true, question: questions[5]},
                          {text: 'Тургенев', question: questions[5]},
                          {text: 'Некрасов', question: questions[5]},
                          {text: 'Блок', question: questions[5]},
                          {text: 'Гранатовый браслет', question: questions[6]},
                          {text: 'Крестьянские дети', question: questions[6]},
                          {text: 'Мертвые души', correct: true, question: questions[6]},
                          {text: 'Генерал Топтыгин', question: questions[6]},
                          {text: 'Мастер и Маргарита', question: questions[7]},
                          {text: 'Отцы и дети', question: questions[7]},
                          {text: 'Тёмные аллеи', question: questions[7]},
                          {text: 'Тимур и его команда',correct: true, question: questions[7]}
                        ])

results = Result.create([
                          {status: true, user: users[0], test: tests[0]},
                          {status: true, user: users[0], test: tests[1]},
                          {status: true, user: users[1], test: tests[0]},
                          {status: true, user: users[1], test: tests[1]}
                        ])