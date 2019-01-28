Fabricator(:series) do
  # Faker does not have Faker::Movie.title
  title { Faker::Book.unique.title }
  medium { Fabricate(:medium, medium_type: 'Series') }
end
