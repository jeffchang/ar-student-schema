require_relative '../config'
require_relative '../../app/models/student'
# this is where you should use an ActiveRecord migration to 

class UpdateStudents < ActiveRecord::Migration
  def up
    add_column :students, :name, :string
    add_column :students, :address, :string

    Student.all.each do |student|
      student.name = student.first_name + ' ' + student.last_name
      student.save
    end

    remove_column :students, :first_name
    remove_column :students, :last_name
  end

  def down
    add_column :students, :first_name, :string
    add_column :students, :last_name, :string

    Student.all.each do |student|
      names = student.name.split(' ')
      student.first_name = names.shift
      student.last_name = names.join(' ')
      student.save
    end

    remove_column :students, :name
    remove_column :students, :address
  end

end
