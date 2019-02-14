Fabricator(:episode) do
  # Faker does not have Faker::Movie.title
  title { Faker::Book.unique.title }
  season do
    existing_season = Season.all.sample if [true, false].sample && Season.any?
    existing_season || Fabricate(:season)
  end
  medium { Fabricate(:medium, medium_type: 'Episode') }
end
