categories = Category.create!([{ title: 'Frontend' }, { title: 'Backend' }, { title: 'Db' }])

tests = Test.create!([{ title: 'Test for test', level: 2, category: categories[1], author: User.find_by(type: 'Admin') },
                      { title: 'React', level: 1, category: categories[0], author: User.find_by(type: 'Admin') },
                      { title: 'HTML/CSS', level: 1, category: categories[0], author: User.find_by(type: 'Admin') },
                      { title: 'SQL', level: 2, category: categories[2], author: User.find_by(type: 'Admin') }])

questions = Question.create! [{ body: 'First question', test: tests[0] },
                              { body: 'Second question', test: tests[0] },
                              { body: 'Third question', test: tests[0] },
                              { body: 'Fourth question', test: tests[0] },
                              { body: 'Fifth question', test: tests[0] },
                              { body: 'Sixth question', test: tests[0] },
                              { body: 'Seventh question', test: tests[0] },
                              { body: 'Eighth question', test: tests[0] },
                              { body: 'Ninth question', test: tests[0] },
                              { body: 'Tenth question', test: tests[0] },
                              { body: 'What is style component?', test: tests[1] },
                              { body: 'Difference between HTML4 and HTML5', test: tests[2] },
                              { body: 'Write example of JOIN query', test: tests[3] },
                              { body: 'Difference between lambda and prock', test: tests[3] }]

Answer.create! [{ body: 'Correct answer', correct: true, question: questions[0] },
                { body: 'Second answer ', question: questions[0] },
                { body: 'Third answer ', question: questions[0] },
                { body: 'Fourth answer ', question: questions[0] },
                { body: 'Correct answer', correct: true, question: questions[1] },
                { body: 'Second answer ', question: questions[1] },
                { body: 'Correct answer ', correct: true, question: questions[1] },
                { body: 'Fourth answer ', question: questions[1] },
                { body: 'Correct answer', correct: true, question: questions[2] },
                { body: 'Second answer ', question: questions[2] },
                { body: 'Third answer ', question: questions[2] },
                { body: 'Fourth answer ', question: questions[2] },
                { body: 'Correct answer', correct: true, question: questions[3] },
                { body: 'Second answer ', question: questions[3] },
                { body: 'Third answer ', question: questions[3] },
                { body: 'Fourth answer ', question: questions[3] },
                { body: 'Correct answer', correct: true, question: questions[4] },
                { body: 'Second answer ', question: questions[4] },
                { body: 'Third answer ', question: questions[4] },
                { body: 'Fourth answer ', question: questions[4] },
                { body: 'Correct answer', correct: true, question: questions[5] },
                { body: 'Second answer ', question: questions[5] },
                { body: 'Third answer ', question: questions[5] },
                { body: 'Fourth answer ', question: questions[5] },
                { body: 'Correct answer', correct: true, question: questions[6] },
                { body: 'Second answer ', question: questions[6] },
                { body: 'Third answer ', question: questions[6] },
                { body: 'Fourth answer ', question: questions[6] },
                { body: 'Correct answer', correct: true, question: questions[7] },
                { body: 'Second answer ', question: questions[7] },
                { body: 'Third answer ', question: questions[7] },
                { body: 'Fourth answer ', question: questions[7] },
                { body: 'Correct answer', correct: true, question: questions[8] },
                { body: 'Second answer ', question: questions[8] },
                { body: 'Third answer ', question: questions[8] },
                { body: 'Fourth answer ', question: questions[8] },
                { body: 'Correct answer', correct: true, question: questions[9] },
                { body: 'Correct answer ', correct: true, question: questions[9] },
                { body: 'Correct answer ', correct: true, question: questions[9] },
                { body: 'Correct answer ', correct: true, question: questions[9] },
                { body: 'Some text about HTML', correct: true, question: questions[10] },
                { body: 'Wrong JOIN query', question: questions[11] },
                { body: 'Some text about prock and lambda', question: questions[12] }]
