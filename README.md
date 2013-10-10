# Sinatra/ActiveRecord Homework #1

Create a basic clone to emulate the functionality of [Hacker News](https://news.ycombinator.com/). 

You'll want a table of 'stories' that have the following fields:

- title
- link
- body
- up_votes
- down_votes
- timestamps

The user will only submit either title/link, or title/body. `up_votes` and `down_votes` will be set at zero by default. Unless attempting the bonus, don't implement voting and leave them at zero.

There are *no* users in this system, and anyone can create, delete, and view stories. Do not attempt to implement a user system. Do not attempt to implement a commenting system, as we will do this tomorrow.

Make it so that you can view an index of all stories, view individual stories, update, delete and submit new stories. 

Use Sinatra and ActiveRecord to make all of this work. 

### Bonuses

- Attempt to figure out how to require only title/link, or title/body and disallow inputting the three of them. This will be tricky and has multiple solutions
- Attempt to implement a voting system, which each story has buttons for voting up and down. Display the current total score for each story. Also, display the order of the stories on the index page from most votes to fewest votes.
- Try to make the CSS look as close to Hacker News as realistically possible. Don't copy or reference their CSS code. 

## Reading for Tonight

Please read the following: 

- [ActiveRecord Query RailsGuide documentation](http://guides.rubyonrails.org/active_record_querying.html)
- [ActiveRecord::Base documentation](http://api.rubyonrails.org/classes/ActiveRecord/Base.html_)
- [ActiveRecord::Migration documentation](http://api.rubyonrails.org/classes/ActiveRecord/Migration.html)
