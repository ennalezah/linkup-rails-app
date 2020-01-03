class Group < ApplicationRecord
  ## Associations
  has_many :events, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships

  ## Validations
  validates_presence_of :name, :description, :city, :state
  validates_uniqueness_of :name, message: 'name has already been taken'
  validates :city, city: true
end
