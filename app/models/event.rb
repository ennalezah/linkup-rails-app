class Event < ApplicationRecord
  ## Associations
  belongs_to :group
  has_many :attendances, dependent: :destroy
  has_many :users, through: :attendances

  ## Validations
  # before_validation :make_city_titlecase
  validates_presence_of :name, :details, :start_time, :end_time, :location, :city, :state, :organizer, :group_id
  validate :date_cannot_be_in_the_past
  validates :city, city: true

  ## Scope
  default_scope { order(date: :desc) }
  scope :upcoming, lambda { where('date >= ?', Time.now) } # lambda reavluates scope each time it's called
  scope :past, lambda { where('date < ?', Time.now) }

  def add_organizer_to_attendees(current_user)
    self.users << current_user if current_user.email
  end

  private 

  def date_cannot_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:date, "<br>must select a future date".html_safe)
    end
  end

  
end
