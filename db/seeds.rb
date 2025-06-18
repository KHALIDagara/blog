# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Clear existing data
puts "Clearing old data..."
Post.destroy_all
Tag.destroy_all

# Create tags
puts "Creating tags..."
tech_tag = Tag.create!(name: "Tech")
startup_tag = Tag.create!(name: "Startup")
rails_tag = Tag.create!(name: "Ruby on Rails")

# Create posts
puts "Creating posts..."
Post.create!(
  title: "The Future of AI in Tech",
  content: "Artificial Intelligence is reshaping the technology landscape...",
  tags: [tech_tag]
)

Post.create!(
  title: "Bootstrapping Your Startup to Success",
  content: "Here are ten tips for growing your startup with limited funding...",
  tags: [startup_tag]
)

Post.create!(
  title: "Why Rails is Still a Great Choice in 2025",
  content: "Ruby on Rails continues to be a powerful framework for building modern web apps.",
  tags: [tech_tag, rails_tag]
)

puts "Seed data created successfully!"
