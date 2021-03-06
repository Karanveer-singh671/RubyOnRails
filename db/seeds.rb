# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times { |topic| Topic.create!(title: "Topic #{topic}") }

10.times do |blog|
  Blog.create!(
    title: "My Blog Post #{blog}",
    body:
      'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Obcaecati, minus consectetur. Tempora pariatur odit, nam at nesciunt ullam quae itaque fugiat iure? Deserunt vitae animi iure, reiciendis dolore placeat officiis.',
    topic_id: Topic.last.id
  )
end

puts '10 blog posts created'

5.times { |skill| Skill.create!(title: "Rails #{skill}", percent_utilized: 15) }

puts '5 skills created'

8.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio Title #{portfolio_item}",
    subtitle: 'My Service',
    body:
      'Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorem esse sunt quam eligendi molestias. Corrupti repellendus, repellat nobis quasi libero illum ut, at obcaecati nesciunt eos tempore officiis quis minus.',
    main_image: 'https://place-hold.it/600x600',
    thumb_image: 'https://place-hold.it/300x300'
  )
end

puts '9 portfolios created'

3.times do |technology|
  Technology.create!(
    name: "Technology #{technology}",
    portfolio_id: Portfolio.last.id
  )
end

puts '3 Technologies created'
