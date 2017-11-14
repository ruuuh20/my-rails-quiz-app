class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.integer :user_id
      t.string :content
      

      t.timestamps
    end
  end
end
