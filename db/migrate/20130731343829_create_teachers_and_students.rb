require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class CreateTeachersAndStudents < ActiveRecord::Migration
  def change
    # HINT: checkout ActiveRecord::Migration.create_table

    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
    end    

    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.date :birthday
      t.string :email
      t.string :phone
    end    

    create_table :students_teachers do |t|
      t.belongs_to :teacher
      t.belongs_to :student
    end

  end
end
