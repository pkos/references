class Reference < ActiveRecord::Base
  belongs_to :user
  validates_length_of :title, :maximum => 140
end
