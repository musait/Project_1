class CreateJoinTableFormationPosition < ActiveRecord::Migration[5.2]
  def change
    create_join_table :positions, :formations do |t|
       t.index [:position_id, :formation_id]
       t.index [:formation_id, :position_id]
    end
  end
end
