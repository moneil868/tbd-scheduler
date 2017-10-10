class AddDetailsToCourses < ActiveRecord::Migration[5.1]
  def up
    add_column :courses, :course_code, :string
    add_column :courses, :meeting_section_code, :string
  end

  def down
    remove_column :courses, :course_code, :string
    remove_column :courses, :meeting_section_code, :string
  end


end
