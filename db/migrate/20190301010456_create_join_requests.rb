class CreateJoinRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :join_requests do |t|
      t.references :user, foreign_key: true
      t.references :campaign, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
