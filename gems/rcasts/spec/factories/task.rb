FactoryBot.define do
  factory :task do
    title { 'First task' }
    description { 'text' }
    complete { true }
    priority { 3 }
    position { 3 }
    user
    project
  end
end
