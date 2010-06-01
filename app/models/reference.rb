class Reference < ActiveRecord::Base
  attr_accessible :title, :authors, :abstract, :journal, :pmid
  
  belongs_to :user
  
  validates_presence_of :abstract, :user_id
  validates_length_of   :abstract, :maximum => 140
  
  default_scope :order => 'created_at DESC'
  
end
