class Article < ActiveRecord::Base
  attr_accessible :article_id, :author_mail, :author_name, :content, :tag, :title, :type
  validates_presence_of :author_mail, :author_name, :content
  validates :author_mail, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ }
end
