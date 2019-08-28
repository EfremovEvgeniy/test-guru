# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create([{ title: 'Frontend' }, { title: 'Backend' }, { title: 'DB' }])

Test.create([{ tite: 'Ruby', level: 2, categories_id: 2 },
             { tite: 'React', level: 1, categories_id: 1 },
             { tite: 'HTML/CSS', level: 1, categories_id: 1 },
             { tite: 'SQL', level: 2, categories_id: 3 }])

Question.create [{ body: 'Hashes and arrays', test_id: 1 },
                 { body: 'What is style component?', test_id: 2 },
                 { body: 'Difference between HTML4 and HTML5', test_id: 3 },
                 { body: 'Write example of JOIN query', test_id: 4 },
                 { body: 'Difference between lambda and prock', test_id: 1 }]

User.create([{ name: 'Evgenii', email: 'efremoven94@gmail.com' },
             { name: 'Nikolay', email: 'johne32rus23@gmail.com' },
             { name: 'Kristina', email: 'example@admin.com' }])

Answer.create [{ body: 'Some text about hashes and arrays', correct: true, question_id: 1 },
               { body: 'I don know ', question_id: 2 },
               { body: 'Some text about HTML', correct: true, question_id: 3 },
               { body: 'Wrong JOIN query', question_id: 4 },
               { body: 'Some text about prock and lambda', question_id: 5 }]
