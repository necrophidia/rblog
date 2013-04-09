class Post < Article
  validates_presence_of :title
  has_many :likes, :dependent => :destroy, :as => :likeable
  has_many :comments, :dependent => :destroy, :foreign_key => 'article_id'
  has_many :child_comments, :through => :comments, :source => :comments

end
