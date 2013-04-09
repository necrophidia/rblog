class Like < ActiveRecord::Base
  attr_accessible :likeable_id, :likeable_type, :user_id
  belongs_to :likeable, :polymorphic => true
  has_many :likes, :dependent => :destroy, :as => :likeable


  def likes_hash
  	if self.likes.count == 0
  		return self.attributes
  	else
  		likes_ary = []
  		self.likes.each do |l|
  			likes_ary << l.likes_hash
  		end
  		result = self.attributes.merge({:likes => likes_ary})

  		return result
  	end
  end
end
