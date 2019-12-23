class Event < ApplicationRecord
  ## Associations
  belongs_to :group

  has_many :attendances, dependent: :destroy
  has_many :users, through: :attendances


  ## Scope
  default_scope { order(date: :desc) }
  scope :upcoming, lambda { where('date >= ?', Time.now) } # lambda reavluates scope each time it's called
  scope :past, lambda { where('date < ?', Time.now) }


  ## Validations
  validates_presence_of :name, :details, :date, :start_time, :end_time, :location, :city, :state
  before_validation :make_city_titlecase
  # validates :city, format: { with: /[A-Za-z\-\'\.]+/x, message: "Cannot contain numbers or special characters" }

  private 

    def make_city_titlecase
      self.city = self.city.titlecase
    end
end
