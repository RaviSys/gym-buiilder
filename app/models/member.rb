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

  def self.to_csv(fields = column_names, options = {})
    CSV.generate(options) do |csv|
      	csv << fields
      	all.each do |member|
        	csv << member.attributes.values_at(*fields)
      	end
    end
  end
end
