# Dungeon Wizard
Dungeon Wizard is a single-page app that allows users to create an account, browse through a list of Dungeons & Dragons campaigns that are looking for members, and request to join one that interests them. They can filter the list of campaigns based on a number of playing style and experience level options. In response, Dungeon Masters (those who create and manage the campaigns) can create campaigns, approve or reject join requests, and update their campaign page with the next play session date that only their approved players can see. 
Dungeon Wizard is a React/Rails application. This repository is the Rails back-end; in order to see the entire project please [check out the React front-end repository](https://github.com/pnolan89/dungeon-wizard). 


## Motivation
Dungeon Wizard is the final group project for Web Development bootcamp at Lighthouse Labs. Group members: [Peter Nolan](https://github.com/pnolan89), [Matt Kelly](https://github.com/mattrkelly27), [Erin Toth](https://github.com/erinltoth)

## Project Stack
* Front-end: HTML, CSS, Axios, React-Router, ReactJS, NodeJS
* Back-end: Ruby on Rails, Postgres

## Project Setup
1. Clone this repository into the folder of your choice.

2. `bundle install` to install dependancies 

3. `rake db:create`

4. `rake db:migrate`

5. `rake db:seed` (if you would like the application seeded with data. If you would like to create all data yourself you can omit this step)

6. `rails start` (make sure [front-end server](https://github.com/pnolan89/dungeon-wizard) is also downloaded and running)

7. Navigate to [http://localhost:3002](http://localhost:3002) to see the application in action. If you would like to navigate the information served from the database you can do so via [http://localhost:3000](http://localhost:3000).


## Screenshots

<img src="https://github.com/pnolan89/dungeon-wizard/blob/master/public/images/campaign-index.png" alt="Campaign Index" width="1000" />


<img src="https://github.com/pnolan89/dungeon-wizard/blob/master/public/images/campaign-detail.png" alt="Campaign Detail" width="1000" />

<img src="https://github.com/pnolan89/dungeon-wizard/blob/master/public/images/user-detail.png" alt="User Detail" width="1000" />

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).