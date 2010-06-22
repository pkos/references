class Reference < ActiveRecord::Base
  attr_accessible :authors, :title, :journal, :volume, :issue, :pages,
                  :year, :pubmed, :medline, :abstract, :url, :mesh,
                  :affiliations, :refblob
                  
  belongs_to :user
  
  validates_presence_of :refblob, :user_id
  validates_length_of   :refblob, :maximum => 5000

  default_scope :order => 'created_at DESC'
  
end
