class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :songs, :artist, :artist_name
  end
end
