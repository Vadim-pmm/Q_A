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

  def parse_and_save(file_)
    begin
      new_question = JSON.load(File.open(file_.path))
      Question.create(new_question)
      return 200
    rescue
      return 422
    end
  end

end
