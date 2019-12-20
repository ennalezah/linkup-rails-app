class Event < ApplicationRecord
  belongs_to :group

  scope :with_upcoming_date, -> { where("start_date > #{Time.current}") }

  # validate :is_city_titlecase

  # before_validation :make_city_titlecase

  validates :name, :details, :date, :start_time, :end_time, :location, :city, :state, presence: { message: "Cannot be left blank" }

  # validates :city, format: { with: /[A-Za-z\-\'\.]+/x, message: "Cannot contain numbers or special characters" }

  private 
  
    # def is_city_titlecase
    #   if city.split.any?{|w|w[0].upcase != w[0]}
    #     errors.add(:city, "City must be in title case")
    #   end
    # end

    # def make_city_titlecase
    #   self.city = self.city.titlecase
    # end
end
