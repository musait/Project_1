class Position < ApplicationRecord
  has_and_belongs_to_many :formations
  has_many :position_validations
  has_many :users, through: :position_validations
end
