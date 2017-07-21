class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string   :question, null: false
      t.text     :answer,   null: false
      t.string   :category, null: false, index: true
      t.string   :lang,     null: false, index: true

      t.datetime :created_at, null: false
    end
  end
end
