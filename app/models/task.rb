class Task < ActiveRecord::Base
  
 
  belongs_to :user
  
  default_scope order('position ASC')
  
  private
  
end