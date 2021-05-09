class AddAdminToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_teacher, :boolean, null: false
  end
end
