class AddPositionToPositionValidation < ActiveRecord::Migration[5.2]
  def change
    add_reference :position_validations, :position, foreign_key: true
  end
end
