Fabricator(:view) do
  viewer do
    # as either an existing user or newly generated user
    existing_users = User.all if User.any? && [true, false].sample
    existing_users ? existing_users.sample : Fabricate(:reviewer)
  end
  medium do
    # randomly review an existing medium or newly generated medium
    medium_type = ['episode', 'season', 'series', 'movie'].sample.to_sym
    existing_media = Medium.all if Medium.any? && [true, true, false].sample
    existing_media ? existing_media.sample : Fabricate(medium_type).medium
  end
end