class Event < ApplicationRecord
  ## Associations
  belongs_to :group

  has_many :attendances, dependent: :destroy
  has_many :users, through: :attendances


  ## Scope
  scope :with_upcoming_date, -> { where("start_date > #{Time.current}") }


  ## Validations
  validates :name, :details, :date, :start_time, :end_time, :location, :city, :state, presence: { message: "Cannot be left blank" }
  before_validation :make_city_titlecase
  # validates :city, format: { with: /[A-Za-z\-\'\.]+/x, message: "Cannot contain numbers or special characters" }

  private 
  
    # def is_city_titlecase
    #   if city.split.any?{|w|w[0].upcase != w[0]}
    #     errors.add(:city, "City must be in title case")
    #   end
    # end

    def make_city_titlecase
      self.city = self.city.titlecase
    end
end
