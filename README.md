# Stack-Overflow-Clone

This project was developed over the course of a semester in collaboration with four other group members. We followed the Agile lifecycle, utilizing pull requests, creating and prioritizing user stories, assigning points for tasks, and engaging in pair programming. The primary goal was to create a low-level replica of StackOverflow while adhering to Agile principles. 

## Features

Post Management: Users can create and save posts

Profile Page: Users can has a profile page, containing their created and saved posts. Admin users have a unique "approval" feature on their page

User Navigation: Ability to scroll through posts and tags easily and by filtering with a search bar that utilized partial-matching

BDD Testing: Implemented Cucumber with Gherkin syntax to ensure robust behavior-driven development 

Deployted: Previously hosted on fly.io

## Tech Stack 

Backend: Ruby

Frontend: JavaScript, HTML, CSS, Bootstrap

Testing Frameworks: Cucumber with Gherkin, RSpec

Deployment: Prev. Fly.io

## Setup and Installation

1. Clone this repository
2. Navigate to the project directory
3. Install dependencies:
   ```bundle install
  npm install ```
4. Set up the database
   rails db:create
   rails db:migrate
6. Run the server
   rails server
7. Open your browser and visit http://localhost:3000

## Testing 
1. Ensure dependencies are installed
   bundle install

2. run tests
   cucumber
   rspec
