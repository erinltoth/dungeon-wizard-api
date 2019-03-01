class User < ApplicationRecord
  has_many :campaigns
  has_many :user_campaigns
end