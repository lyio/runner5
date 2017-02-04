json.extract! user, :id, :fullname, :username, :email, :login_token, :token_generated_at, :created_at, :updated_at
json.url user_url(user, format: :json)