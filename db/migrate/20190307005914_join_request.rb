class JoinRequest < ActiveRecord::Migration[5.2]
  def change
    change_column :join_requests, :dm_confirm, :string
  end
end
