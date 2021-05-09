class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :text
      t.boolean :correct
      t.references :question, foreign_key: true
      t.integer :score,
      t.timestamps
    end
  end
end
