class View < ApplicationRecord
  belongs_to :viewer, class_name: 'User', foreign_key: :user_id
  belongs_to :medium
end
