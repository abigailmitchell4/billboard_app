class AddBillboardsAssociationToArtist < ActiveRecord::Migration[6.0]
  def self.up
    add_column :billboards, :artist_id, :integer
    add_index 'billboards', ['artist_id'], :name => 'index_artist_id' 
  end

  def self.down
      remove_column :billboards, :artist_id
  end
  
end
