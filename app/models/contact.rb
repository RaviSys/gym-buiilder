class Contact < ApplicationRecord
  # Validations
  validates :name, :message, presence: true
  validates :email, :contact_number, presence: true, uniqueness: true

  def self.import(file)
  	CSV.foreach(file.path, headers: true) do |row|
  		contact_hash = row.to_hash
  		contact = find_or_create_by!(name: contact_hash['name'], email: contact_hash['email'], contact_number: contact_hash['contact_number'], message: contact_hash['message'])
  		contact.update_attributes(contact_hash)
  	end
  end
end
