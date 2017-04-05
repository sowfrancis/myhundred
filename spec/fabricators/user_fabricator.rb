Fabricator(:user) do
  email    { sequence(:email){ |i| "user_#{i}@example.com" } }
  first_name "Francis"
  last_name "Sow"
  password 'changeme'
  password_confirmation 'changeme'
end
