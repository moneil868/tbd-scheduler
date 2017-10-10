class AddUserIdToCourses < ActiveRecord::Migration[5.1]
  def up
    add_column :courses, :user_id, :integer
  end

  def down
    remove_column :courses, :user_id, :integer
  end
end
