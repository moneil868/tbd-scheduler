class AddColumnToMeetingSections < ActiveRecord::Migration[5.1]
  def change
    add_column :meeting_sections, :course_id, :integer
    add_column :instructors, :meeting_section_id, :integer
    add_column :course_times, :meeting_section_id, :integer

  end
end
