class CreateQuizzes < ActiveRecord::Migration[5.0]
  def change
    create_table :quizzes do |t|
      t.string :title
      t.string :description
      t.boolean :published
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
