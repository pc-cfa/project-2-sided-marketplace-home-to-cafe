class User < ApplicationRecord
  has_many :reviews, :class_name => 'Review', :foreign_key => 'reviewee'
  has_many :reviewers, :class_name => 'Review', :foreign_key => 'reviewer'
  has_many :products
  has_one :cafe_owner_profiles
  has_one :home_baker_profiles

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, 
          :validatable, :authentication_keys => [:login]         

  validates :username, :presence => true, :uniqueness => { :case_sensitive => false }
           
end
