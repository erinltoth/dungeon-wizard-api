class User < ApplicationRecord
  has_many :campaigns
  has_many :user_campaigns

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :playing_style, presence: true
  validates :exp_level, presence: true

end