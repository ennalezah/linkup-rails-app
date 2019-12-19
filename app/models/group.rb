class Group < ApplicationRecord
  ## Associations
  has_many :events, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships

  ## Validations
  validate :is_city_titlecase
  before_validation :make_city_titlecase  
  validates :name, :description, :city, :state, presence: { message: "Cannot be left blank" } 
  validates :city, format: { with: /\A[A-Za-z\s\-\'\.]+\z/, message: "Cannot contain numbers or special characters" }

  private 

    def is_city_titlecase
      if city.split.any?{|w|w[0].upcase != w[0]}
        errors.add(:title, "Title must be in title case")
      end
    end

    def make_city_titlecase
      self.city = self.city.titlecase
    end
end
