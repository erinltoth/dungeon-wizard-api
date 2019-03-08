class Synoposis < ActiveRecord::Migration[5.2]
  def change
    rename_column :campaigns, :synoposis, :synopsis
  end
end
