class AddStatusToJoining < ActiveRecord::Migration
  def change
    remove_column :joinings, :accepted
    add_column :joinings, :status, :integer, default: 0
  end
end
