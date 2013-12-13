class Issue < ActiveRecord::Base
  
  belongs_to :user
  
  validates :title, presence: true
  
  default_scope order('status DESC')

  
end