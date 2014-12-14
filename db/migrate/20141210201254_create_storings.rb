class CreateStorings < ActiveRecord::Migration
  def change
    create_table :storings do |t|
      t.references :snippet, index: true
      t.references :collection, index: true

      t.timestamps
    end
  end
end
