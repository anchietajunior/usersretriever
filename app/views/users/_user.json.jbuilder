json.extract! user, :id, :name, :email, :phone, :gender, :height, :weigth, :username, :birth_date, :image, :created_at, :updated_at
json.url user_url(user, format: :json)
