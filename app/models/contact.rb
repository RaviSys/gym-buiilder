class Contact < ApplicationRecord
  # Validations
  validates :name, :message, presence: true
  validates :email, :contact_number, presence: true, uniqueness: true

  def self.import(file)
  	CSV.foreach(file.path, headers: true) do |row|
  		contact_hash = row.to_hash
  		contact = create(contact_hash)
  	end
  end
end
