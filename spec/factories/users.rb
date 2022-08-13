FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '111111q' }
    password_confirmation { password }
    first_name            { '急' }
    last_name             { '急' }
    first_name_kana       { 'キュウ' }
    last_name_kana        { 'キュウ' }
    birthday              { '1930-1-1' }
  end
end
