class CreateCourseTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :course_times do |t|
      t.string :day
      t.integer :start
      t.integer :end
      t.integer :duration
      t.string :location

      t.timestamps
    end
  end
end
