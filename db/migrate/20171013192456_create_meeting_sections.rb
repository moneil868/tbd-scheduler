class CreateMeetingSections < ActiveRecord::Migration[5.1]
  def change
    create_table :meeting_sections do |t|
      t.string :code
      t.integer :size

      t.timestamps
    end
  end
end
