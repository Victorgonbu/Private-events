# Private events project

## About the project

This is a private events website where you can create your own account, log in, create events and invite who ever is registered in the website. For this project i practiced and get familiar with Rails Associations and Active Record queries.

## Restrictions

### Logged in
* Only users who are logged in are able to create events.

### Attendees
* Only registered users can receive invitations from other users private events.

## Getting Started

To get this wonderful Website running in your local machine, just follow the next simple steps:

- First make sure you have Ruby 2.7.0 and Rails 6 installed in your local machine. If you don't have them, don't worry, just follow this awesome How-to guide in [Hackernoon](https://hackernoon.com/installing-ruby-on-rails-6-on-ubuntu-a-how-to-guide-r8b732vn)

- Clone this repository into your local machine with the following command line:

```bash
  $ https://github.com/Shaqri/Private-events.git
```

- Run bundle to install/use all required gems

```bash
  $ bundle install
```

- Migrate the database

```bash
  $ rails db:migrate
```

- Run the website in your local host

```bash
  $ rails server
```

- Go ahead an enter the local host address in your favorite browser

-> localhost:3000

- Finally Create your own account and all Private events you want. Don't forget to invite your friends!.

### Automated Test
* Run the RSpec command to check everything is working properly

```bash
$ rspec
```
## Built with
* Ruby
* RSpec
* Rubocop
* Capybara

## Author

👤 **Victor Manuel Gonzalez Buitrago**

- Github: [@Shaqri](https://github.com/Shaqri)
- Twitter: [@victorgonbu](https://twitter.com/victorgonbu)
- Linkedin: [linkedin](https://www.linkedin.com/in/victor-manuel-gonzalez-buitrago/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- [Thanks Microverse][https://github.com/microverseinc]

## 📝 License

This project is [MIT](LICENSE) licensed.
