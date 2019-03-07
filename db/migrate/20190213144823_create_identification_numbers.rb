class CreateIdentificationNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :identification_numbers do |t|
      t.integer :id_number

      t.timestamps
    end
  end
end
