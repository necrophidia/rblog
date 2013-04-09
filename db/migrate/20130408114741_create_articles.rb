class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :type
      t.integer :article_id
      t.string :author_name
      t.string :author_mail
      t.string :title
      t.text :content
      t.string :tag

      t.timestamps
    end
  end
end
