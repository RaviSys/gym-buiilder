class Member < ApplicationRecord
  # Validations
  validates :first_name, :last_name, :contact_number, :city, :state, :country, :address, :zipcode, :gender, :date_of_birth, presence: true
  validates :email, presence: true, uniqueness: true

  # Instance methods

  def name
    "#{self.first_name} #{self.last_name}".strip
  end
end
