class CreateQuizzes < ActiveRecord::Migration[5.1]
  def change
    create_table :quizzes do |t|
      t.string :title
      t.string :description
      t.integer :course_id


      t.timestamps
    end
  end
end
