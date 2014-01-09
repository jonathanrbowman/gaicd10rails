class Task < ActiveRecord::Base
  
 
  belongs_to :user
  
  validates :position, presence: true
  validates :title, presence: true
  validates :description, presence: true
  
  default_scope order('position ASC')
  
end