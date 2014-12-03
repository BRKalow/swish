class AddPermalinkToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :permalink, :string
  end
end
