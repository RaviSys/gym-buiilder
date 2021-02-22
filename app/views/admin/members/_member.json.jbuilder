json.extract! member, :id, :first_name, :last_name, :contact_number, :email, :city, :state, :country, :zipcode, :address, :gender, :date_of_birth, :created_at, :updated_at
json.url member_url(member, format: :json)
