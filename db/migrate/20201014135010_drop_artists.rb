class DropArtists < ActiveRecord::Migration[6.0]
  def change
    drop_table :artists
  end
end
