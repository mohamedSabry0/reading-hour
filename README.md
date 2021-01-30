# Reading Books Scheduler App With Ruby on Rails

## Table of Contents

- [Deployment](#Deployment)
- [User Scenarios](#user-scenarios)
- [Presentation](#presentation)
- [Built With](#built-with)
- [Example applications](#example-applications)
- [Getting started](#getting-started)
	- [Prerequisites](#prerequisites)
	- [Setup](#setup)
	- [Usage](#usage)
	- [Run Tests](#run-tests)
- [Author](#author)
- [Contributing](#contributing)
- [Acknolodgement](#Acknowledgments)
- [Show Your Support](#show-your-support)
- [License](#license)
## Deployment
the app is deployed on heroku and the link is:

https://obscure-plateau-96513.herokuapp.com/

## User Scenarios
Following MVP version of the app, these are the basic user scenarios:

- Extra feature for login: you can use either username or email along with the password (devise is used for authentication)
- The user is presented with a profile page that includes links to:
    - "All my time spans".
    - "All my nongrouped time spans".
    - "All groups".
- When user opens "All my time spans" page:
    - Total amount is displayed at the top.
    - A list of all time blocks created by logged-in user is displayed (sorted by most recent).
    - Each time block displays its name, amount and date, and an icon of the first group it has been assigned to.
    - An action button "Add new" is displayed.
- When user opens "All my nongrouped time spans" page:
    - A list of all time blocks that are created by a logged-in user but not assigned to any group is displayed (sorted by most recent).
    - The design of the page is similar to the "All my time spans".
- When user opens "All groups" page:
    - A list of all groups is displayed in alphabetical order.
    - Each group displays its icon, name and creation date.
    - Each group is clickable and opens "Group time spans" page.
    - An action button "Create new" is displayed.
    - The design of the page is similar to the "User profile page"
- When user opens the "Group time spans" page:
    - A list of all transactions that belong to that group is displayed.
    - The design of the page is similar to the "All my time spans". Besides the information that appears in All my time spans page, each time span displays the name of the author of time span.
- When user opens "Create new group" or "Add new time span" page:
    - A form with all necessary fields is displayed.

- The guidelines of the given design, including:
    - Colors
    - typographies: font face, size and weight (use similar ones to the design)
    - layout: composition and space between elements

## Presentation
[presentation video](https://www.loom.com/share/9218a6ae785b4874936e6ea254b5b307)
## Built With

Ruby v2.7.2  
Ruby on Rails v6.0.3.4
## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

Ruby: 2.7.2 
Rails: 6.0.3.4  
Postgres: >=12.5

### Setup

Install gems with:

```
bundle install
```

Setup database with:

```
   rails db:create
   rails db:migrate
```

### Usage

Start server with:

```
    rails server
```

Open http://localhost:3000/ in your browser.

### Run tests
```
    rspec --format doc
```
or if you want it to open an instance of the browser you can use the following instead:
```
    GUI=true rpsec --format doc
```
if you get `password authentication failed for user "postgres"`
then, you will need to change the password in `config/database.yml` on line 62 to your own `postgres` user's password
## Author

👤 Mohamed Sabry

- Github: [@mohamedSabry0](https://github.com/mohamedSabry0)
- Twitter: [twitter profile](https://twitter.com/mohsmh0)
- Linkedin: [linkedin profile](https://www.linkedin.com/in/mohamed-sabry0/)

## Acknowledgments
- [autocomplete select from list](https://medium.com/@sherzelsmith/add-a-filtering-multiple-tag-system-with-autocomplete-to-your-rails-model-in-rails-5-1bf88cd53e9)
- [the design I used as a guide](https://www.behance.net/gallery/19759151/Snapscan-iOs-design-and-branding?tracking_source=) - [the Designer](https://www.behance.net/gregoirevella)
- https://stackoverflow.com/a/30782337/6010915
- https://andycroll.com/ruby/use-simplecov/


## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT]() licensed.
