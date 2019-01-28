Fabricator(:episode) do
  # Faker does not have Faker::Movie.title
  title { Faker::Book.unique.title }
  season
  medium { Fabricate(:medium, medium_type: 'Episode')}
end