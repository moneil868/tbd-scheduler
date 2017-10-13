class RemoveDetailsFromCourses < ActiveRecord::Migration[5.1]
  def change
    remove_column :courses, :course_code, :string
    remove_column :courses, :meeting_section_code, :string
    remove_column :courses, :user_id, :string
  end
end
