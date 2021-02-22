class Contact < ApplicationRecord
  # Validations
  validates :name, :message, presence: true
  validates :email, :contact_number, presence: true, uniqueness: true
end
