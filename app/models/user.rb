class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]


  ## Associations
  has_many :memberships, dependent: :destroy
  has_many :groups, through: :memberships

  has_many :attendances, dependent: :destroy
  has_many :events, through: :attendances


  ## Validations
  validates_presence_of :name, :email
  validates_uniqueness_of :email, message: 'an account with this email has already been created'

  private

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
