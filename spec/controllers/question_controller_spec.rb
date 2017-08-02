require 'rails_helper'

describe QuestionsController do
  valid_record = '<p>Some text </p>'
  let(:valid_question) { Hash(question: valid_record, answer: valid_record, category: 'RoR', lang: 'RoR') }

  context 'POST :import' do
    it 'responds with js' do
      f_ = File.new('json_test.json', 'w')
      JSON.dump(valid_question, f_)
      f_.close

      f_ = Rack::Test::UploadedFile.new('json_test.json', 'json')
      post :import, params: { file: f_ }, xhr: true
      expect(response.header['Content-Type']).to match('text/javascript')
      f_.close
    end
  end

  context 'GET :get_question' do
    it 'responds with JSON format' do
      q = Question.create(valid_question)
      get :get_question, params: { id: q.id }, xhr: true
      expect { JSON.parse(response.body) }.not_to raise_error(JSON::ParserError)
    end
  end
end
