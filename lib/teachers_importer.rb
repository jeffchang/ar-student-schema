require_relative '../app/models/teacher'
require 'faker'

module TeachersImporter
  def self.import
    Teacher.transaction do
      field_names = [:first_name, :last_name, :email, :phone]
      9.times do
        data = [Faker::Name.first_name, Faker::Name.last_name, Faker::Internet.email, Faker::PhoneNumber.phone_number]
        attribute_hash = Hash[field_names.zip(data)]
        teacher = Teacher.create!(attribute_hash)
      end
    end
  end
end
