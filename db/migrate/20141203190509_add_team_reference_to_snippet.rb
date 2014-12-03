class AddTeamReferenceToSnippet < ActiveRecord::Migration
  def change
    add_reference :snippets, :team, index: true
  end
end
