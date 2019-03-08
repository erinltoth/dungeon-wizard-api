class NextSessionAndAvatarColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :campaigns, :next_session, :datetime
    add_column :users, :avatar, :string
  end
end
