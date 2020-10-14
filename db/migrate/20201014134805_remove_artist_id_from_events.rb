class RemoveArtistIdFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :artist_id, :integer
  end
end
