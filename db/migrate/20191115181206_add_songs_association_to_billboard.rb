class AddSongsAssociationToBillboard < ActiveRecord::Migration[6.0]
  def self.up
    add_column :songs, :billboard_id, :integer
    add_index 'songs', ['billboard_id'], :name => 'index_billboard_id' 
  end

  def self.down
      remove_column :songs, :billboard_id
  end
end
