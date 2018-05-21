Rails.logger.level = 3

ips = (1..50).to_a.map { Faker::Internet.ip_v4_address  }
authors = (1..100).to_a.map { Faker::Internet.user_name }

200_000.times do |i|
  post = PostHandler.perform("author_login": "#{authors.sample}", "author_ip": "#{ips.sample}",
                             "content": "#{Faker::Lorem.paragraph}", "title": "#{Faker::Lorem.sentence}").post


  3.times do
    post.rates.create!(value: rand(1..5))
  end

  post.update_average_rate!

  puts "#{i} done" if (i%1_000).zero?
end
