class Like < ActiveRecord::Base
  attr_accessible :likeable_id, :likeable_type, :user_id
  belongs_to :likeable, :polymorphic => true
  has_many :likes, :dependent => :destroy, :as => :likeable
end
