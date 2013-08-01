require 'rspec'
require 'date'
require_relative '../app/models/teacher'
require_relative '../app/models/student'

describe Teacher do

  before(:each) do
    @teacher = Teacher.all.sample
  end

  it "should have lots of students" do
    @teacher.students.first.class.should == Student
  end

end

describe Teacher, "validations" do

  before(:all) do
    raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless ActiveRecord::Base.connection.table_exists?(:teachers).should be_true
    Teacher.delete_all
  end

  before(:each) do
    @teacher = Teacher.new
    @teacher.assign_attributes(
      :first_name => "Kreay",
      :last_name => "Shawn",
      :email => 'kreayshawn@oaklandhiphop.net',
      :phone => '(510) 555-1212 x4567'
    )
  end

  it "shouldn't allow two teachers with the same email" do
    another_teacher = Teacher.create!(
      :email => @teacher.email,
      :phone => @teacher.phone
    )
    @teacher.should_not be_valid
  end

end
