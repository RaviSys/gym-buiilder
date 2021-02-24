class Plan < ApplicationRecord
  # Validations
  validates :name, :price, :duration, presence: true

  # Association
  has_many :member_plans, dependent: :destroy

  # Instance Methods
  def amount
    "RS. #{price}"
  end

  def monthly?
    self.name == 'Monthly'
  end

  def quarterly?
    self.name == 'Quarterly'
  end

  def yearly?
    self.name == 'Yearly'
  end
end
