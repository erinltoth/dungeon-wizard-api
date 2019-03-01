class CreateUserCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :user_campaigns do |t|

      t.timestamps
    end
  end
end
