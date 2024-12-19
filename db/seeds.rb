
  # This file should ensure the existence of records required to run the application in every environment (production,
  # development, test). The code here should be idempotent so that it can be executed at any point in every environment.
  # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
  #
  # Example:
  #
  #   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
  #     MovieGenre.find_or_create_by!(name: genre_name)
  #   end

@user1=User.create!(username: 'user', password: 'password', firstname: 'User', lastname: 'Lastname', email: 'user@colgate.edu', role: 'student')
@user2=User.create!(username: 'prof', password: 'password', firstname: 'professor', lastname: 'Schmoe', email: 'prof@colgate.edu', role: 'instructor')
@user_cred2 = UserCred.create!(user_id: @user2.id, school: "Stack Overflow University", details: "I have been a computer science professor at Stack Overflow University for 5 years", approved: true)

@user3=User.create!(username: 'admin', password: 'password', firstname: 'admin', lastname: 'admin', email: 'admin@colgate.edu', role: 'admin')
@user4=User.create!(username: 'jschmoe', password: 'password', firstname: 'Joe', lastname: 'Schmoe', email: 'jschmoe@colgate.edu', role: 'student')
@user_cred4 = UserCred.create!(user_id: @user4.id, name: "Joe Schmoe", school: "Real School", details: "I am definitely a professor...", approved: false)
@user5=User.create!(username: 'jdoe', password: 'password', firstname: 'John', lastname: 'Doe', email: 'jdoe@colgate.edu', role: 'student')
@user6 = User.create!(username: 'janed', password: 'password', firstname: 'Jane', lastname: 'Doe', email: 'janed@colgate.edu', role: 'student')

# Tags
Tag.create!(name: "", description: "Empty Tag")
@python_tag = Tag.create!(name: "Python", description: "Python is a programming language that allows for many different programming practices including Object Oriented Programming and many machine learning packages ")
Tag.create!(name: "Java", description: "Java is a programming language with static typing to create code that can be run on any platform once completed")
Tag.create!(name: "C", description: "C is a programming language that allows for specific interactions with the low-level processes of programming")
@ruby_tag = Tag.create!(name: "Ruby", description: "Ruby is a programming language designed to reduce confusion by following consistent procedures and giving freedom to programmers")
@rails_tag = Tag.create!(name: "Ruby on Rails", description: "Ruby on Rails is a series of packages for Ruby used for Software Engineering and Agile Programming")
@sql_tag = Tag.create!(name: "SQL", description: "SQL is a language used to analyze and work with databases")
Tag.create!(name: "R", description: "R is a programming language primarily used for statistical purposes")
Tag.create!(name: "Javascript", description: "Javascript is a language used for webpage user interaction purposes and other complicated website interface code")
Tag.create!(name: "Git", description: "Git is a method for teams of programmers to work with branches, version control, and working apart")


  
Tag.create!(name: "", description: "Empty Tag")
@python_tag=Tag.create!(name: "Python", description: "Python is a programming language that allows for many different programming practices including Object Oriented Programming and many machine learning packages ")
Tag.create!(name: "Java", description: "Java is an programming languages with static typing to create code that can be ran ony any platform once completed")
Tag.create!(name: "C", description: "C is a programming language that allows for specific interactions with the low level processes of programming")
@ruby_tag=Tag.create!(name: "Ruby", description: "Ruby is a programming language designed to reduce confusion by following consistent procedures and giving freedom to programmers")
@rails_tag=Tag.create!(name: "Ruby on Rails", description: "Ruby on Rails is a series of packages for Ruby used for Software Engineering and Agile Programming")
@sql_tag=Tag.create!(name: "SQL", description: "SQL is a language used to analyze and work with databases")
Tag.create!(name: "R", description: "R is a programming language primarily used for statistical purposes")
Tag.create!(name: "Javascript", description: "Javascript is a language used for webpage user interaction purposes and other complicated website interface code")
Tag.create!(name: "Git", description: "Git is a method for teams of programmers to work with branchs, version control, and working apart")

Tag.create!(name: "Design Principles", description: "Questions that are asking about the why behind design decisions")
Tag.create!(name: "Compilation Error", description: "Questions asking about errors with programs compiling")
Tag.create!(name: "Semantic Error", description: "Questions asking about programs producing unexpected output")
Tag.create!(name: "Runtime Error", description: "Questions asking about programs producing errors at runtime")

@instr_tag=Tag.create!(name: "Instructor Response", description: "Posts where an instructor has responded")


@post1=Post.create!(
    title: "Issue running rails db:seed",
    text: "I am running into this issue when I try and run rails db:seed bin/rails aborted! ActiveRecord::RecordInvalid: Validation failed: Email has already been taken (ActiveRecord::RecordInvalid)",
    user: @user4,
    created_at: Time.new(2024, 12, 6, 14, 30))
@post1.tags <<  @rails_tag

  
@post1.tags << @instr_tag
@post1.save!



@post2 = Post.create!(
  title: "How to debug undefined method error in Ruby",
  text: "I'm working on a Ruby script and keep getting an undefined method error for a method that clearly exists. Any ideas?",
  user: @user1,
  created_at: Time.new(2024, 12, 5, 10, 15)
)
@post2.tags << @ruby_tag  # Add the tag to the post through the association
@post2.tags << @instr_tag

@post2.save!

@post3 = Post.create!(
  title: "Why is my Python script slow?",
  text: "I have a Python script processing a large dataset, but it takes hours to run. How can I speed it up?",
  user: @user6,
  created_at: Time.new(2024, 12, 4, 9, 30)
)
@post3.tags << @python_tag  # Add the tag to the post through the association
@post3.tags << @instr_tag

@post3.save!

@post4 = Post.create!(
  title: "Why does my SQL query return unexpected results?",
  text: "I am trying to join two tables, but the query returns more rows than expected. What could be causing this?",
  user: @user2,
  created_at: Time.new(2024, 12, 3, 14, 45)
)
@post4.tags << @sql_tag  # Add the tag to the post through the association
@post4.save!

# Replies
Reply.create!(post: @post1, text: "Try running rails db:drop db:create db:migrate db:seed", user: @user5, created_at: Time.new(2024, 12, 6, 16, 45))
Reply.create!(post: @post1, text: "This issue requires you to completely delete your entire project. This is a symptom of a greater issue with the project that requires it to be completely remade", user: @user2, created_at: Time.new(2024, 12, 6, 20, 11))
Reply.create!(post: @post1, text: "I have no clue", user: @user3, created_at: Time.new(2024, 12, 6, 21, 43))

Reply.create!(post: @post2, text: "Ensure you have required the file containing the method.", user: @user2, created_at: Time.new(2024, 12, 5, 11, 45))
Reply.create!(post: @post2, text: "Sometimes the method's name might be misspelled. Double-check your code.", user: @user5, created_at: Time.new(2024, 12, 5, 13, 20))

Reply.create!(post: @post3, text: "Consider using NumPy or pandas for optimized data processing.", user: @user4, created_at: Time.new(2024, 12, 4, 10, 15))
Reply.create!(post: @post3, text: "If you are doing repetitive operations, use caching or memoization.", user: @user1, created_at: Time.new(2024, 12, 4, 11, 00))
Reply.create!(post: @post3, text: "Your version of python is obviously corrupted in some way. You need to reinstall it completely", user: @user2, created_at: Time.new(2024, 12, 4, 11, 00))
Reply.create!(post: @post3, text: "Windows is having an issue processing your python file due to a file issue. Delete the system32 file", user: @user3, created_at: Time.new(2024, 12, 4, 11, 00))

Reply.create!(post: @post4, text: "Make sure you're using the correct type of join for your use case.", user: @user4, created_at: Time.new(2024, 12, 3, 15, 30))
Reply.create!(post: @post4, text: "Check if there are duplicate rows in your tables that might cause the issue.", user: @user5, created_at: Time.new(2024, 12, 3, 16, 00))
Reply.create!(post: @post4, text: "Use SELECT * FROM table1, table2 without a WHERE clause for better results.", user: @user3, created_at: Time.new(2024, 12, 3, 17, 00))
Reply.create!(post: @post4, text: "You probably need to reinstall your database software.", user: @user1, created_at: Time.new(2024, 12, 3, 18, 00))
Reply.create!(post: @post4, text: "Joining tables will never work; you need to rewrite your entire application.", user: @user3, created_at: Time.new(2024, 12, 3, 19, 00))

# Votes for posts
12.times { Vote.create!(user: User.all.sample, votable: @post1, vote_type: :up) }
12.times { Vote.create!(user: User.all.sample, votable: @post2, vote_type: :up) }
27.times { Vote.create!(user: User.all.sample, votable: @post3, vote_type: :up) }
19.times { Vote.create!(user: User.all.sample, votable: @post4, vote_type: :up) }

# Votes for replies
13.times { Vote.create!(user: User.all.sample, votable: Reply.find_by(post: @post1, text: "Try running rails db:drop db:create db:migrate db:seed"), vote_type: :up) }
9.times { Vote.create!(user: User.all.sample, votable: Reply.find_by(post: @post1, text: "This issue requires you to completely delete your entire project. This is a symptom of a greater issue with the project that requires it to be completely remade"), vote_type: :down) }
5.times { Vote.create!(user: User.all.sample, votable: Reply.find_by(post: @post1, text: "I have no clue"), vote_type: :down) }

17.times { Vote.create!(user: User.all.sample, votable: Reply.find_by(post: @post2, text: "Ensure you have required the file containing the method."), vote_type: [:up, :down].sample) }
15.times { Vote.create!(user: User.all.sample, votable: Reply.find_by(post: @post2, text: "Sometimes the method's name might be misspelled. Double-check your code."), vote_type: [:up, :down].sample) }
10.times { Vote.create!(user: User.all.sample, votable: Reply.find_by(post: @post3, text: "Consider using NumPy or pandas for optimized data processing."), vote_type: :up) }
15.times { Vote.create!(user: User.all.sample, votable: Reply.find_by(post: @post3, text: "If you are doing repetitive operations, use caching or memoization."), vote_type: [:up, :down].sample) }
7.times { Vote.create!(user: User.all.sample, votable: Reply.find_by(post: @post3, text: "Your version of python is obviously corrupted in some way. You need to reinstall it completely"), vote_type: :up) }
9.times { Vote.create!(user: User.all.sample, votable: Reply.find_by(post: @post3, text: "Windows is having an issue processing your python file due to a file issue. Delete the system32 file"), vote_type: :down) }

15.times { Vote.create!(user: User.all.sample, votable: Reply.find_by(post: @post4, text: "Make sure you're using the correct type of join for your use case."), vote_type: :up) }
10.times { Vote.create!(user: User.all.sample, votable: Reply.find_by(post: @post4, text: "Check if there are duplicate rows in your tables that might cause the issue."), vote_type: :up) }
8.times { Vote.create!(user: User.all.sample, votable: Reply.find_by(post: @post4, text: "Use SELECT * FROM table1, table2 without a WHERE clause for better results."), vote_type: [:up, :down].sample) }
5.times { Vote.create!(user: User.all.sample, votable: Reply.find_by(post: @post4, text: "You probably need to reinstall your database software."), vote_type: :down) }
3.times { Vote.create!(user: User.all.sample, votable: Reply.find_by(post: @post4, text: "Joining tables will never work; you need to rewrite your entire application."), vote_type: :down) }
8.times { Vote.create!(user: User.all.sample, votable: Reply.find_by(post: @post2, text: "Ensure you have required the file containing the method."), vote_type: :up) }