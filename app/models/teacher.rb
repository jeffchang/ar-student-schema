require_relative '../../db/config'
require 'date'

class Teacher < ActiveRecord::Base

  has_many :students

  validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]{2,}\z/i, :message => "Invalid email address"
  validates_uniqueness_of :email
  validates_length_of :phone_digits, :minimum => 10

  def phone_digits
    self.phone.gsub(/\D/, "")
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end

end
