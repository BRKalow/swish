class AddUserToSnippet < ActiveRecord::Migration
  def change
    add_reference :snippets, :user, index: true
  end
end
