Fabricator(:season) do  
  number { rand(1..100) }  
  series do
    existing_series = Series.all.sample if [true, false].sample && Series.any?
    existing_series || Fabricate(:series) 
  end
  medium { Fabricate(:medium, medium_type: 'Season') }
end
