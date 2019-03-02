class AddConfirmationsToJoinRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :join_requests, :player_confirm, :boolean
    add_column :join_requests, :dm_confirm, :boolean
    rename_column :join_requests, :status, :message
  end
end
