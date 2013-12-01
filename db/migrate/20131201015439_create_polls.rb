class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.integer :teamAWins
      t.integer :teamALosses
      t.integer :teamAPointsFor
      t.integer :teamAPointsAgainst
      t.string :teamALocation
      t.integer :teamBWins
      t.integer :teamBLosses
      t.integer :teamBPointsFor
      t.integer :teamBPointsAgainst
      t.string :teamBLocation
      t.integer :question_id

      t.timestamps
    end
  end
end
