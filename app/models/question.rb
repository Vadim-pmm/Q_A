class Question < ApplicationRecord
  has_many :answers
  validate :qa_format

  def self.get_new_ids(question_type_, session_)
    always_answered = Answer.where(session_id: DateTime.parse(session_)).pluck(:question_id)
    where(lang: question_type_).ids.sample(4) - always_answered
  end

  def self.get_unanswered(question_type_, session_)
    where(id: get_new_ids(question_type_, session_))
  end

  def qa_format
    if question[0..2] != '<p>' || question[-4..-1] != '</p>' || answer[0..2] != '<p>' || answer[-4..-1] != '</p>'
      errors.add(:format, 'Wrong format: missing <p> tag')
    end
  end

end
