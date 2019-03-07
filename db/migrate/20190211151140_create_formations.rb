class CreateFormations < ActiveRecord::Migration[5.2]
  def change
    create_table :formations do |t|
      t.string :title
      t.text :description
      t.string :link
      t.string :position
      t.integer :position_number

      t.timestamps
    end
  end
end
