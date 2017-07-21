module SaveAllQuestions
  require 'json'

  def save_all_questions
    questions = []
    Question.all.each do |item|
      questions << { question: item.question, answer: item.answer, category: item.category, lang: item.lang }
    end
    f = File.new('export.json', 'w')
    JSON.dump(questions, f)
    f.close
  end

end
