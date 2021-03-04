class Member < ApplicationRecord
  # Validations
  validates :first_name, :last_name, :contact_number, :city, :state, :country, :address, :zipcode, :gender, :date_of_birth, presence: true
  validates :email, presence: true, uniqueness: true

  # Associations
  has_one :member_plan

  # Instance methods

  def name
    "#{self.first_name} #{self.last_name}".strip
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      member_hash = row.to_hash
      member = create(member_hash)
    end
  end
end
