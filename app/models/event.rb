class Event < ApplicationRecord
  ## Associations
  belongs_to :group
  has_many :attendances, dependent: :destroy
  has_many :users, through: :attendances

  ## Validations
  validate :date_cannot_be_in_the_past
  validates_presence_of :name, :details, :start_time, :end_time, :location, :city, :state, :organizer, :group_id

  ## Scope
  default_scope { order(date: :desc) }
  scope :upcoming, lambda { where('date >= ?', Time.now) } # lambda reavluates scope each time it's called
  scope :past, lambda { where('date < ?', Time.now) }

  private 
  
  def date_cannot_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:date, "<br>must select a future date".html_safe)
    end
  end
end
