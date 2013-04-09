# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do
    type ""
    article_id 1
    author_name "MyString"
    author_mail "MyString"
    title "MyString"
    content "MyText"
    tag "MyString"
  end
end
