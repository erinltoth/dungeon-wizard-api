class CampaignsUpgrade < ActiveRecord::Migration[5.2]
  def change
    add_column :campaigns, :player_limit, :integer
    add_column :campaigns, :synoposis, :text
  end
end
