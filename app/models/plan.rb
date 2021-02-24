class Plan < ApplicationRecord
  # Validations
  validates :name, :price, :duration, presence: true

  # Association
  has_many :member_plans. dependent: :destroy

  # Instance Methods
  def amount
    "RS. #{price}"
  end
end
