FactoryBot.define do
  factory :project do
    name { 'First project' }
    description { 'text' }
    user
  end
end
