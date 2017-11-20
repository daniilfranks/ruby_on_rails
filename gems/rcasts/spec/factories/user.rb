FactoryBot.define do
  factory :user do
    name { 'Den' }
    email { 'me@den.ru' }
    password { '12345' }
    admin { 'true' }
  end
end
