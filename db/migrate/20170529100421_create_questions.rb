class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string   :question, index: true
      t.text     :answer
      t.string   :category
      t.string   :lang, limit: 2, index: true

      t.datetime :created_at, null: false
    end
  end
end
