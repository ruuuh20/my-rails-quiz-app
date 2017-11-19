class AddStatusToQuiz < ActiveRecord::Migration[5.1]
  def change
    add_column :quizzes, :status, :string
  end
end
