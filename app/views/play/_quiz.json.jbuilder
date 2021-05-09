json.extract! quiz, :id, :title, :description

json.category quiz.category, :name

json.questions quiz.questions do |question|
  json.extract! question, :text

  json.answers question.answers.order('random()') do |answer|
    json.extract! answer, :text, :correct
  end
end
