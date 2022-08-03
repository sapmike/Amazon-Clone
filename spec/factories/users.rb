FactoryBot.define do
  factory :user do
    first_name { "Michael"}
    last_name {"Sapienza"}
    email {"email@email.com"}
    password_digest {"secret"}
  end
end


#have not migrated this table in testing db
