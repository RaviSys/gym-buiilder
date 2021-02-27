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
      member = find_or_create_by!(first_name: member_hash['first_name'], last_name: member_hash['last_name'], contact_number: member_hash['contact_number'], email: member_hash['email'], city: member_hash['city'], state: member_hash['state'], country: member_hash['country'], zipcode: member_hash['zipcode'], address: member_hash['address'], gender: member_hash['gender'], date_of_birth: member_hash['date_of_birth'])
      member.update_attributes(member_hash)
    end
  end
end
