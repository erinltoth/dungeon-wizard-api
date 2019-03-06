class AddTagColumnsToCampaigns < ActiveRecord::Migration[5.2]
  def change
    add_column :campaigns, :exp_level, :string
    add_column :campaigns, :playing_style, :string
  end
end
