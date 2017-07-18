class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.references  :question
      t.datetime    :session_id

      t.datetime :created_at, null: false
    end
  end
end
