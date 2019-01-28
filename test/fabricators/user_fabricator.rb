Fabricator(:reviewer, from: :user) do
  username { Faker::Name.unique.name }
  email { "#{Faker::Lorem.characters(10)}@#{Faker::Lorem.characters(10)}.com" }
  password { Faker::Lorem.word }
end
