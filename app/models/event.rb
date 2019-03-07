class Event < ApplicationRecord
  belongs_to :address, optional: true
  belongs_to :user, optional: true
  accepts_nested_attributes_for :address
  validates :title, presence: true
  validates :description, presence: true
end
