categories = Category.create!([{ title: 'Frontend' }, { title: 'Backend' }, { title: 'Db' }])

users = User.create!([{ name: 'Evgenii', email: 'efremoven94@gmail.com' },
                      { name: 'Nikolay', email: 'johne32rus23@gmail.com' },
                      { name: 'Kristina', email: 'example@admin.com' }])

tests = Test.create!([{ title: 'Ruby', level: 2, category_id: categories.second.id, author_id: 1 },
                      { title: 'React', level: 1, category_id: categories.first.id, author_id: 2 },
                      { title: 'HTML/CSS', level: 1, category_id: categories.first.id, author_id: 1 },
                      { title: 'SQL', level: 2, category_id: categories.third.id, author_id: 1 }])

questions = Question.create! [{ body: 'Hashes and arrays', test_id: tests.first.id },
                              { body: 'What is style component?', test_id: tests.second.id },
                              { body: 'Difference between HTML4 and HTML5', test_id: tests.third.id },
                              { body: 'Write example of JOIN query', test_id: tests.fourth.id },
                              { body: 'Difference between lambda and prock', test_id: tests.first.id }]

Answer.create! [{ body: 'Some text about hashes and arrays', correct: true, question_id: questions.first.id },
                { body: 'I don know ', question_id: questions.second.id },
                { body: 'Some text about HTML', correct: true, question_id: questions.third.id },
                { body: 'Wrong JOIN query', question_id: questions.fourth.id },
                { body: 'Some text about prock and lambda', question_id: questions.fifth.id }]

users.first.tests.push(tests.first)
