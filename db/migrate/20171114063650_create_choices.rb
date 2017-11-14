class CreateChoices < ActiveRecord::Migration[5.1]
  def change
    create_table :choices do |t|
      t.integer :question_id
      t.string :content

      t.timestamps
    end
  end
end
