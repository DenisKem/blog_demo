FactoryGirl.define do
  factory :post do
    author factory: :user
    author_ip "127.0.0.1"
    title "Greetings"
    content "Hello world!"
  end
end
