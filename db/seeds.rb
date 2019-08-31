categories = Category.create!([{ title: 'Frontend' }, { title: 'Backend' }, { title: 'Db' }])

tests = Test.create!([{ title: 'Ruby', level: 2, categories_id: categories.second.id },
                      { title: 'React', level: 1, categories_id: categories.first.id },
                      { title: 'HTML/CSS', level: 1, categories_id: categories.first.id },
                      { title: 'SQL', level: 2, categories_id: categories.third.id }])

questions = Question.create! [{ body: 'Hashes and arrays', tests_id: tests.first.id },
                              { body: 'What is style component?', tests_id: tests.second.id },
                              { body: 'Difference between HTML4 and HTML5', tests_id: tests.third.id },
                              { body: 'Write example of JOIN query', tests_id: tests.fourth.id },
                              { body: 'Difference between lambda and prock', tests_id: tests.first.id }]

users = User.create!([{ name: 'Evgenii', email: 'efremoven94@gmail.com' },
                      { name: 'Nikolay', email: 'johne32rus23@gmail.com' },
                      { name: 'Kristina', email: 'example@admin.com' }])

Answer.create! [{ body: 'Some text about hashes and arrays', correct: true, questions_id: questions.first.id },
                { body: 'I don know ', questions_id: questions.second.id },
                { body: 'Some text about HTML', correct: true, questions_id: questions.third.id },
                { body: 'Wrong JOIN query', questions_id: questions.fourth.id },
                { body: 'Some text about prock and lambda', questions_id: questions.fifth.id }]

users.first.tests.push(tests.first)
