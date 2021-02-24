class Plan < ApplicationRecord
  # Validations
  validates :name, :price, :duration, presence: true

  # Instance Methods
  def amount
    "RS. #{price}"
  end
end
