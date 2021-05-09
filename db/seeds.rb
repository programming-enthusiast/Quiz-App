# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.find_or_create_by(email: 'seeder@localhost')

category = Category.find_or_create_by(name: 'Linux')

quiz = Quiz.find_or_create_by(category: category, user: user, title: 'Linux Quiz', description: 'A simple Linux quiz')

question = Question.find_or_create_by(quiz: quiz, text: 'What is the core of Linux Operating System?')
[['Kernel', true], ['Shell', false], ['Terminal', false], ['Script', false]].each do |a|
  Answer.find_or_create_by(question: question, text: a[0], correct: a[1])
end

question = Question.find_or_create_by(quiz: quiz, text: 'Which Command is used to check the kernel Version?')
[['uname -r', true], ['kernel', false], ['kernel-version', false], ['uname -v', false]].each do |a|
  Answer.find_or_create_by(question: question, text: a[0], correct: a[1])
end

question = Question.find_or_create_by(quiz: quiz, text: 'What is name of first process in Linux?')
[['init', true], ['first', false], ['start', false], ['run', false]].each do |a|
  Answer.find_or_create_by(question: question, text: a[0], correct: a[1])
end

question = Question.find_or_create_by(quiz: quiz, text: 'What is the default uid & gid of root user?')
[['0', true], ['1', false], ['42', false], ['1000', false]].each do |a|
  Answer.find_or_create_by(question: question, text: a[0], correct: a[1])
end

question = Question.find_or_create_by(quiz: quiz, text: 'How to check the current runlevel of a Linux box?')
[['who -r', true], ['runlevel', true], ['init 0', false], ['runlevel -v', false]].each do |a|
  Answer.find_or_create_by(question: question, text: a[0], correct: a[1])
end

question = Question.find_or_create_by(quiz: quiz, text: 'How to check the ip address of LAN card?')
[['ip a', true], ['ip', false], ['lan', false], ['ip-address', false]].each do |a|
  Answer.find_or_create_by(question: question, text: a[0], correct: a[1])
end

question = Question.find_or_create_by(quiz: quiz, text: 'How to check the default gateway?')
[['route -n', true], ['ip g', false], ['gateway', false], ['route -g', false]].each do |a|
  Answer.find_or_create_by(question: question, text: a[0], correct: a[1])
end

question = Question.find_or_create_by(quiz: quiz, text: 'What are the kinds of permissions under Linux?')
[['read, write, execute', true], ['create, update, destroy', false], ['read write', false], ['N/A', false]].each do |a|
  Answer.find_or_create_by(question: question, text: a[0], correct: a[1])
end

question = Question.find_or_create_by(quiz: quiz, text: 'What is a Unix shell?')
[['zsh', true], ['ysh', false], ['wsh', false], ['hsh', false]].each do |a|
  Answer.find_or_create_by(question: question, text: a[0], correct: a[1])
end

question = Question.find_or_create_by(quiz: quiz, text: 'Which command is used for scheduling?')
[['crontab', true], ['schedule', false], ['calendar', false], ['execute --time', false]].each do |a|
  Answer.find_or_create_by(question: question, text: a[0], correct: a[1])
end

(2..6).each do |i|
  quiz = Quiz.find_or_create_by(category: category, user: user, title: "Quiz #{i}", description: 'A quiz')

  (1..10).each do |j|
    question = Question.find_or_create_by(quiz: quiz, text: "Question #{j}")

    (1..4).each do |k|
      Answer.find_or_create_by(question: question, text: "Answer #{k}", correct: k == 1)
    end
  end
end
