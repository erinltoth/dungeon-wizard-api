class JoinRequest < ApplicationRecord
  belongs_to :user
  belongs_to :campaign
  # after_initialize :init

  # def init
  # end
end
