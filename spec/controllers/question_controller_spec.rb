require 'rails_helper'

describe QuestionsController do
  let(:valid_record) { '<p>Some text </p>' }

  context 'import' do
    it 'responds with js' do
      f_ = File.new('json_test.json', 'w')
      o_ = [{ question: valid_record, answer: valid_record, category: 'RoR', lang: 'RoR' }]
      JSON.dump(o_, f_)
      f_.close

      f_ = Rack::Test::UploadedFile.new('json_test.json', 'json')
      post :import, params: { 'file' => f_, :format => 'js' }
      expect(response.header['Content-Type']).to match('text/javascript')
      f_.close
    end
  end

  it ''

end
