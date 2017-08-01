require 'rails_helper'

describe Question do

  # validations - db level
  it 'prevents questions with empty <category>' do
    invalid_record = { question:'<p>Some text </p>', answer: '<p>Some text </p>', category: nil, lang: 'RoR' }

    expect { Question.create(invalid_record) }.to raise_error(ActiveRecord::NotNullViolation)
  end

  it 'prevents questions with empty <lang>' do
    invalid_record = { question:'<p>Some text </p>', answer: '<p>Some text </p>', category: 'JQuery', lang: nil }

    expect { Question.create(invalid_record) }.to raise_error(ActiveRecord::NotNullViolation)
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