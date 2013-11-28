class Task < ActiveRecord::Base
  
  belongs_to :user
  
  default_scope order('step ASC')
  
end
