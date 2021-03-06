class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.string :description
      t.string :location

      t.timestamps
    end
  end
end
