class Contact < ApplicationRecord
  # Validations
  validates :name, :message, presence: true
  validates :email, :contact_number, presence: true, uniqueness: true

  def self.to_csv(fields = column_names, options = {})
  	CSV.generate(options) do |csv|
  		csv << fields
  		all.each do |contact|
  			csv << contact.attributes.values_at(*fields)
  		end
  	end
  end
end
