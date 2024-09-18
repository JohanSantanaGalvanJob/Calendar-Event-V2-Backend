class User < ApplicationRecord

  has_secure_password

  validates :last_name, presence: true, length: { minimum: 5, maximum: 20 }, format: { with: /\A[a-zA-ZñÑ]+(\s[a-zA-ZñÑ]+)?\z/, message: "sólo puede contener letras, un solo espacio y la letra 'ñ'" }
  validates :first_name, presence: true, length: { minimum: 5, maximum: 20 }, format: { with: /\A[a-zA-ZñÑ]+\z/, message: "sólo puede contener letras y la letra 'ñ'" }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 },
                       format: { with: /\A(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d]{8,}\z/,
                       message: "Debe incluir al menos una letra mayúscula, una letra minúscula y un número y tener al menos 8 caracteres" }

  has_many :event_user
  has_one_attached :image, dependent: :destroy

  enum role: [:user,:admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role

  self.role ||= :user

  end
end
