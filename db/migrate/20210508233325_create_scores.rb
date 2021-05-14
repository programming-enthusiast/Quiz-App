class CreateScores < ActiveRecord::Migration[6.1]
  def change
    create_table :scores do |t|
      t.references :quiz, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :score, null: false
      t.timestamps
    end

    add_index :scores, [:quiz_id, :user_id], unique: true
  end
end
