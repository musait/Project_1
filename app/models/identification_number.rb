class IdentificationNumber < ApplicationRecord
  validates :id_number, uniqueness: true
end
