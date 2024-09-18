class Location < ApplicationRecord
  has_many :events
  validates :name, presence: true, length: { minimum: 5, maximum: 30 }, format: { with: /\A[a-zA-ZñÑ]+(\s[a-zA-ZñÑ]+)?\z/}
end
