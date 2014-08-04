class Person < ActiveRecord::Base
  has_many :projects

  geocoded_by :zip_code
  after_validation :geocode

end
