require_relative '../../lib/zip_code_lookup.rb'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects

  has_many :broadcasts, :foreign_key => 'broadcaster_id'

  has_many :messages

  has_many :friendships
  has_many :friends, :through => :friendships

  has_many :inverse_friendships, :class_name => 'Friendship', 
           :foreign_key => 'friend_id'
  has_many :inverse_friends, :through => :inverse_friendships, 
           :source => :user

  validates_presence_of :name, :zip_code
  validate :zip_code_valid?

  acts_as_taggable
  geocoded_by :zip_code
  after_validation :geocode

  private 

  def zip_code_valid?
    errors.add(:zip_code) unless ZipCodeLookup.valid?(zip_code)
  end
end
