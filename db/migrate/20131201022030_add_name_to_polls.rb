class AddNameToPolls < ActiveRecord::Migration
  def change
    add_column :polls, :teamAName, :string
    add_column :polls, :teamBName, :string
  end
end
