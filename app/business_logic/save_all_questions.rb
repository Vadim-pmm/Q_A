module SaveAllQuestions
  require 'csv'

  def save_all_questions
    questions = Question.all
    CSV.open('export.csv', 'a', col_sep: ';', headers: true) do |f|
      f << %w(Question Answer Language Category)
      questions.each do |q|
        f << [q.question, q.answer, q.lang, q.category]
      end
    end
  end
end
