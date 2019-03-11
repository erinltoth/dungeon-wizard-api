class CampaignsPlayingStyles < ActiveRecord::Migration[5.2]
  def change
    add_column :campaigns, :commitment, :string
    add_column :campaigns, :deep_immersion, :boolean
    add_column :campaigns, :sandbox, :boolean
    add_column :campaigns, :battle_focused, :boolean
    add_column :campaigns, :kick_in_the_door, :boolean
    add_column :campaigns, :exploration, :boolean
    add_column :campaigns, :random, :boolean
  end
end
