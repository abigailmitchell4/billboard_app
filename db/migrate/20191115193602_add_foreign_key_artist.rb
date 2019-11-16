class AddForeignKeyArtist < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :billboards, :artists
  end
end
