users = User.create!([
                      {name: 'Иван', password: '1234567890', email: 'ivansizyh26@gmail.com'},
                      {name: 'Павел', password: '0987654321', email: 'pavel@gmail.com'}
                    ])
categories = Category.create!([
                                {title: 'Математика'},
                                {title: 'Программирование'},
                                {title: 'Биология'},
                                {title: 'Литература'}
                              ])
tests = Test.create!([
                      {title: 'Математика средней школы', level: 1, category_id: categories[0].id, author_id: users[0].id},
                      {title: 'Автор и произведение', level: 0, category_id: categories[3].id, author_id: users[1].id},
                    ])

questions = Question.create!([
                              {body: 'Какой будет результат выражения 12 + 18 * 43?', test_id: tests[0].id},
                              {body: 'Чему равно выражение 2^9?', test_id: tests[0].id},
                              {body: 'Какая из формул для нахождения гипотенузы в треугольнике?', test_id: tests[0].id},
                              {body: 'Если в квадратном уравнении дискриминант равен нулю, то количество корней равно...', test_id: tests[0].id},
                              {body: 'Кто явдяется автором произведения \'Горе от ума\'?', test_id: tests[1].id},
                              {body: 'Кто явдяется автором произведения \'Война и мир\'?', test_id: tests[1].id},
                              {body: 'Какое из произведений принадлежит Н. В. Гоголю?', test_id: tests[1].id},
                              {body: 'Какое из произведений принадлежит А. П. Гайдару?', test_id: tests[1].id}
                            ])

Answer.create!([
                {text: '1290', correct: true, question_id: questions[0].id},
                {text: '786', question_id: questions[0].id},
                {text: '2056', question_id: questions[0].id},
                {text: '1860', question_id: questions[0].id},
                {text: '64', question_id: questions[1].id},
                {text: '1024', question_id: questions[1].id},
                {text: '516', correct: true, question_id: questions[1].id},
                {text: '2048', question_id: questions[1].id},
                {text: 'C = sqrt(A^2 + B^2)', correct: true, question_id: questions[2].id},
                {text: 'C = sqrt(A^2 - B^2)', question_id: questions[2].id},
                {text: 'C = A + B', question_id: questions[2].id},
                {text: 'C = 4A - B', question_id: questions[2].id},
                {text: '0', question_id: questions[3].id},
                {text: '1', correct: true, question_id: questions[3].id},
                {text: '2', question_id: questions[3].id},
                {text: '3', question_id: questions[3].id},
                {text: 'Грибоедов', correct: true, question_id: questions[4].id},
                {text: 'Достоевсикй', question_id: questions[4].id},
                {text: 'Гоголь', question_id: questions[4].id},
                {text: 'Тургенев', question_id: questions[4].id},
                {text: 'Толстой', correct: true, question_id: questions[5].id},
                {text: 'Тургенев', question_id: questions[5].id},
                {text: 'Некрасов', question_id: questions[5].id},
                {text: 'Блок', question_id: questions[5].id},
                {text: 'Гранатовый браслет', question_id: questions[6].id},
                {text: 'Крестьянские дети', question_id: questions[6].id},
                {text: 'Мертвые души', correct: true, question_id: questions[6].id},
                {text: 'Генерал Топтыгин', question_id: questions[6].id},
                {text: 'Мастер и Маргарита', question_id: questions[7].id},
                {text: 'Отцы и дети', question_id: questions[7].id},
                {text: 'Тёмные аллеи', question_id: questions[7].id},
                {text: 'Тимур и его команда',correct: true, question_id: questions[7].id}
              ])

Result.create!([
                {status: true, user_id: users[0].id, test_id: tests[0].id},
                {status: true, user_id: users[0].id, test_id: tests[1].id},
                {status: true, user_id: users[1].id, test_id: tests[0].id},
                {status: true, user_id: users[1].id, test_id: tests[1].id}
              ])