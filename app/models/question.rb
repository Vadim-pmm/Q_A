class Question < ApplicationRecord
  has_many :answers

  def self.get_new_ids(question_type_, session_)
    always_answered = Answer.where(session_id: DateTime.parse(session_)).pluck(:question_id)
    where(lang: question_type_).ids.sample(4) - always_answered
  end

  def self.get_unanswered(question_type_, session_)
    where(id: get_new_ids(question_type_, session_))
  end

end
