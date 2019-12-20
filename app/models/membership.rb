class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :interests, format: { with: /\A[\w\W]+\z/ }, allow_blank: true
end
