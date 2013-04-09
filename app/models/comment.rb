class Comment < Article
  has_many :likes, :dependent => :destroy, :as => :likeable
  has_many :comments, :dependent => :destroy, :foreign_key => 'article_id'
  belongs_to :posts
end
