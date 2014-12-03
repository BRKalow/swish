class AddLocationToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :location, :string
  end
end
