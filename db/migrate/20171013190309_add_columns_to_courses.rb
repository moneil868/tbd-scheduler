class AddColumnsToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :code, :string
    add_column :courses, :name, :string
    add_column :courses, :description, :string
    add_column :courses, :department, :string
    add_column :courses, :prerequisites, :string
    add_column :courses, :exclusions, :string
    add_column :courses, :level, :integer
    add_column :courses, :campus, :string
    add_column :courses, :term, :string
  end
end
