  # This file should ensure the existence of records required to run the application in every environment (production,
  # development, test). The code here should be idempotent so that it can be executed at any point in every environment.
  # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
  #
  # Example:
  #
  #   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
  #     MovieGenre.find_or_create_by!(name: genre_name)
  #   end

  User.create!(username: 'user', password: 'password', firstname: 'user', lastname: 'name', email: 'user@colgate.edu', role: 'student')
  User.create!(username: 'prof', password: 'password', firstname: 'professor', lastname: 'professor', email: 'prof@colgate.edu', role: 'instructor')
  User.create!(username: 'admin', password: 'password', firstname: 'admin', lastname: 'admin', email: 'admin@colgate.edu', role: 'admin')

  Tag.create!(name: "", description: "Empty Tag")
  Tag.create!(name: "Python", description: "Python is a programming language that allows for many different programming practices including Object Oriented Programming and many machine learning packages ")
  Tag.create!(name: "Java", description: "Java is an programming languages with static typing to create code that can be ran ony any platform once completed")
  Tag.create!(name: "C", description: "C is a programming language that allows for specific interactions with the low level processes of programming")
  Tag.create!(name: "Ruby", description: "Ruby is a programming language designed to reduce confusion by following consistent procedures and giving freedom to programmers")
  Tag.create!(name: "Ruby on Rails", description: "Ruby on Rails is a series of packages for Ruby used for Software Engineering and Agile Programming")
  Tag.create!(name: "SQL", description: "SQL is a language used to analyze and work with databases")
  Tag.create!(name: "R", description: "R is a programming language primarily used for statistical purposes")
  Tag.create!(name: "Javascript", description: "Javascript is a language used for webpage user interaction purposes and other complicated website interface code")
  Tag.create!(name: "Git", description: "Git is a method for teams of programmers to work with branchs, version control, and working apart")

  Tag.create!(name: "Design Principles", description: "Questions that are asking about the why behind design decisions")
  Tag.create!(name: "Compilation Error", description: "Questions asking about errors with programs compiling")
  Tag.create!(name: "Semantic Error", description: "Questions asking about programs producing unexpected output")
  Tag.create!(name: "Runtime Error", description: "Questions asking about programs producing errors at runtime")
