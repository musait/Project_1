class CreatePositionValidations < ActiveRecord::Migration[5.2]
  def change
    create_table :position_validations do |t|
      t.boolean :approved, default: true

      t.timestamps
    end
  end
end
