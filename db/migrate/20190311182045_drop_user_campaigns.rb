class DropUserCampaigns < ActiveRecord::Migration[5.2]
  def change
    drop_table :user_campaigns
  end
end
