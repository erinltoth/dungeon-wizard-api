class Campaign < ApplicationRecord
  belongs_to :user
  has_many :user_campaigns

  validates :name, presence: true
  validates :location, presence: true
end
