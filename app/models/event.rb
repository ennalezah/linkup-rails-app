class Event < ApplicationRecord
  belongs_to :group

  before_validation :make_city_titlecase

  validates :name, :details, :start_date, :end_date, :location, :city, :state, presence: { message: "Cannot be left blank" } 
  validates :city, format: { with: /\A[A-Za-z\s]+\z/, message: "Can only contain letters" }

  private 
  
    def make_city_titlecase
      self.city = self.city.titlecase
    end
end
