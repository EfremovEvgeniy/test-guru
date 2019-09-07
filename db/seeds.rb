categories = Category.create!([{ title: 'Frontend' }, { title: 'Backend' }, { title: 'Db' }])

users = User.create!([{ name: 'Evgenii', email: 'efremoven94@gmail.com' },
                      { name: 'Nikolay', email: 'johne32rus23@gmail.com' },
                      { name: 'Kristina', email: 'example@admin.com' }])

tests = Test.create!([{ title: 'Ruby', level: 2, category: categories[1], author: users[0] },
                      { title: 'React', level: 1, category: categories[0], author: users[1] },
                      { title: 'HTML/CSS', level: 1, category: categories[0], author: users[0] },
                      { title: 'SQL', level: 2, category: categories[2], author: users[0] }])

questions = Question.create! [{ body: 'Hashes and arrays', test: tests[0] },
                              { body: 'What is style component?', test: tests[1] },
                              { body: 'Difference between HTML4 and HTML5', test: tests[2] },
                              { body: 'Write example of JOIN query', test: tests[3] },
                              { body: 'Difference between lambda and prock', test: tests[0] }]

Answer.create! [{ body: 'Some text about hashes and arrays', correct: true, question: questions[0] },
                { body: 'Second answer ', question: questions[0] },
                { body: 'Third answer ', question: questions[0] },
                { body: 'Fourth answer ', question: questions[0] },
                { body: 'Some text about HTML', correct: true, question: questions[2] },
                { body: 'Wrong JOIN query', question: questions[3] },
                { body: 'Some text about prock and lambda', question: questions[4] }]
