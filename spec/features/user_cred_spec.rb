require 'rails_helper'

RSpec.feature "UserCredentials", type: :feature do



  scenario "Certified user post should not have instructor response tag" do
    user=User.create(username: 'prof', password: 'password', firstname: 'professor', lastname: 'Schmoe', email: 'prof@colgate.edu', role: 'instructor')
    cred = UserCred.create!(user_id: user.id, approved: true)
    allow(user).to receive(:user_cred).and_return(cred)
    tag=Tag.create!(name:"Instructor Response")
    allow(Tag).to receive(:approved).and_return(tag)
    post=Post.create!(user_id: user.id)
    visit(post_path(post))
    expect(page).to_not have_content("Instructor Response")
  end

  scenario "Post with reply by certified user should have instructor response tag" do 
    poster=User.create(username: 'user', password: 'password', firstname: 'User', lastname: 'Lastname', email: 'user2@colgate.edu', role: 'student')
    replier = User.create(username: 'prof', password: 'password', firstname: 'professor', lastname: 'Schmoe', email: 'prof@colgate.edu', role: 'instructor')
    cred = UserCred.create!(user_id: replier.id, approved: true)
    tag=Tag.create!(name:"Instructor Response")
    allow(replier).to receive(:user_cred).and_return(cred)
    allow(Tag).to receive(:approved).and_return(tag)

    post = Post.create!(user_id: poster.id)
    post.replies << Reply.create(text: "Test", post_id: post.id, user_id: replier.id)
    post.save!
    visit(post_path(post))
    expect(page).to have_content("Instructor Response")

  end
end
