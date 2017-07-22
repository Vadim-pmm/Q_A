require 'rails_helper'

describe Question do

  # validations - db level
  it 'prevents questions with empty fields' do
    valid_record = '<p>Some text </p>'
    empty_record = nil
    new_question = Question.create(question: valid_record, answer: valid_record,
                                category: empty_record, lang: empty_record)
    expect(new_question.errors.count).to eq(0)
  end

  # validations - model level
  it 'prevents questions with missing <p> tags' do
    invalid_record = 'Some question'
    new_question = Question.new(question: invalid_record, answer: invalid_record)
    new_question.valid?
    expect(new_question.errors[:format]).to include('Wrong format: missing <p> tag')
  end

  it 'allows questions with <p> tags' do
    valid_record = '<p>Some text </p>'
    new_question = Question.new(question: valid_record, answer: valid_record)
    new_question.valid?
    expect(new_question.errors.count).to eq(0)
  end

end