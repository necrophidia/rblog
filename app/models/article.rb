class Article < ActiveRecord::Base
  attr_accessible :article_id, :author_mail, :author_name, :content, :tag, :title, :type
  validates_presence_of :author_mail, :author_name, :content
  validates :author_mail, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ }


  def comments_hash
  	if self.comments.count == 0
  		return self.attributes
  	else
  		comments_ary = []
  		self.comments.each do |c|
  			comments_ary << c.comments_hash
  		end
  		likes_ary = []
  		self.likes.each do |l|
  			likes_ary << l.likes_hash
  		end
  		result = self.attributes.merge({:comments => comments_ary})
  		result.merge!({:likes => likes_ary}) if self.likes.count > 0

  		return result
  	end
  end
end
