class Group < ApplicationRecord
  ## Associations
  has_many :events, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships

  ## Validations
  validates_presence_of :name, :description, :city, :state
  validates_uniqueness_of :name, message: 'name has already been taken'
  validates :city, city: true

  def add_creator_to_members(current_user)
    self.users << current_user if current_user.email
  end
end
