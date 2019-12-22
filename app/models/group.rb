class Group < ApplicationRecord
  ## Associations
  has_many :events, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships

  ## Validations
  validates_presence_of :name, :description, :city, :state
  validates_uniqueness_of :name, message: 'name has already been taken'

  before_validation :make_city_titlecase  
  #validates :name, :description, :city, :state, presence: { message: "cannot be left blank" }
  #validates :name, uniqueness: true
  validates :city, format: { with: /\A[A-Za-z\s\-\'\.]+\z/, message: "can only contain letters and some special characters" }

  private 

    def make_city_titlecase
      self.city = self.city.titlecase
    end
end
