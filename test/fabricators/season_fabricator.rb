Fabricator(:season) do
  number { rand(1..5) }
  series
  medium { Fabricate(:medium, medium_type: 'Season')}
end