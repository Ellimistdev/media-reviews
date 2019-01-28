module Viewable  
  def self.included(base)
    base.class_eval do 
      has_many :views, through: :medium
      has_many :viewers, through: :medium
    end
  end
end