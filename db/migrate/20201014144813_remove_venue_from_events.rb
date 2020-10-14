class RemoveVenueFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :venue, :string
  end
end
