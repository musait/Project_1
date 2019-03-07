class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :number
      t.string :voie_type
      t.string :street
      t.string :postal_code
      t.string :city

      t.timestamps
    end
  end
end
