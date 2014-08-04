class Person < ActiveRecord::Base
  has_many :projects

  validates_presence_of :name, :zip_code

  geocoded_by :zip_code
  after_validation :geocode

end
