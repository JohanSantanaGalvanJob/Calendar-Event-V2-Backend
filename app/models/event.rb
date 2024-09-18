class Event < ApplicationRecord
  has_many :event_user
  has_one :location
  has_one :event_type
  # has_one_attached :image, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5, maximum: 30 }, format: { with: /\A[a-zA-ZñÑ]+(\s[a-zA-ZñÑ]+)?\z/}
  validates :description, presence: true, length: { minimum: 20, maximum: 1000 }
  validates :url, presence: true, format: {with:/\Ahttps:\/\/[a-zA-Z0-9]+([\-\.]{1}[a-zA-Z0-9]+)*\.[a-zA-Z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/}
  validates :starting_hour, format: { with: /\A([0-1][0-9]|2[0-3]):[0-5][0-9]\z/}
  validates :finished_hour, format: { with: /\A([0-1][0-9]|2[0-3]):[0-5][0-9]\z/}
end
