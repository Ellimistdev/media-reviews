class View < ApplicationRecord
  belongs_to :viewer, class_name: 'User', foreign_key: :user_id
  belongs_to :medium
  validates :viewer, presence: true
  validates :medium, presence: true
  validates_uniqueness_of :viewer, scope: :medium
end
