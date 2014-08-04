require_relative '../../lib/zip_code_lookup.rb'

class Person < ActiveRecord::Base

  has_many :projects

  validates_presence_of :name, :zip_code
  validate :zip_code_valid?

  geocoded_by :zip_code
  after_validation :geocode

  private 

  def zip_code_valid?
    errors.add(:zip_code) unless ZipCodeLookup.valid?(zip_code)
  end

end
