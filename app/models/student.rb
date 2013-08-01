require_relative '../../db/config'
require 'date'

class Student < ActiveRecord::Base

  belongs_to :teacher

  validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]{2,}\z/i, :message => "Invalid email address"
  validates_numericality_of :age, :greater_than_or_equal_to => 5
  validates_uniqueness_of :email
  validates_length_of :phone_digits, :minimum => 10

  def phone_digits
    self.phone.gsub(/\D/, "")
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def age
    ((Date.today - self.birthday) / 365).to_i
  end
  
end
