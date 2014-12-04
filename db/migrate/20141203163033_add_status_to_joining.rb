class AddStatusToJoining < ActiveRecord::Migration
  def change
    add_column :joinings, :status, :integer, default: 0
  end
end
