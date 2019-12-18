class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]


  ## Associations
  has_many :memberships
  has_many :groups, through: :memberships


  ## Validations
  validates :name, presence: true


  ## Model Helpers
  def first_name
    self.name.split.first
  end


  ## OmniAuth Google - called in controllers/users/omniauth_callbacks_controller.rb
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      # user.password = 'Devise.friendly_token[0,20]'
      user.password = 'password'
      user.name = auth.info.name
    end
  end
end
