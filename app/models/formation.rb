class Formation < ApplicationRecord
  has_and_belongs_to_many :positions
  default_scope { order(position_number: :asc) }
end
