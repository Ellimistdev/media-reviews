# TODO
## models
[x] media show needs to clear children, reviews
[ ] restore display of edit and delete buttons when logged in
[x] Must use your Rails application to render a form for creating a resource that is submitted dynamically through JavaScript.
  - [x] implement appendReview() to be called by form submission
  - [x] Intercept new review form submission, 
  - [x] submit via js,
  - [x] render new review on page,
  - [x] refresh form upon successful submission
  - [x] render errors upon unsuccessful submission
  - [x] formSubmission event listener should only be added if form is present
  - [x] children that are an only child are not being rendered
  


# Routes
## sessions | users | reviews | views
action | method | sessions | users | reviews | views
-|-|-|-|-|-
index | get | | | /users/:user_id/reviews | /users/:user_id/views
new | get | /login | /signup | rendered on media#show | rendered on media#show
create | post | /sessions | /users | /reviews | /views 
show | get | | /users/:id |  |  |
edit | get | | /users/:id/edit | /reviews/:id/edit | 
update | patch | | /users/:id | /reviews/:id | 
destroy | post | /logout | | /reviews/:id | /views/:id

## media
action | method | route
-|-|-
show | get | /media/:id (redirects to show path below)

action | method | movie | series | season | episode
-|-|-|-|-|-
index | get | /movies | /series | rendered on series#show | rendered on season#show  
new | get | /movies/new | /series/new | /series/:series_id/seasons/new | /series/:series_id/seasons/:season_id/episodes/new
create | post | /movies | /series | /seasons | /episodes
show | get | /movies/:id | /series/:id | /seasons/:id | /episodes/:id

not accounted for:  
- viewing an individual review  
  - e.g. get media/movies/:id/reviews/:id || get users/:id/reviews/:id

```bash
rails g model User username email password_digest
rails g model Identity provider uid user:belongs_to
rails g model Medium medium_type
rails g model Review content rating user:belongs_to medium:belongs_to
rails g model View user:belongs_to medium:belongs_to
rails g model Movie title medium:belongs_to
rails g model Series title medium:belongs_to
rails g model Season number medium:belongs_to series:belongs_to
rails g model Episode title medium:belongs_to season:belongs_to
```

// const id = document.URL.match(/(\d+)(?!.*\d+)/)[0]; 

# Auth responses
Google
```json
{
  "provider" => "google_oauth2",
  "uid" => "100000000000000000000",
  "info" => {
    "name" => "John Smith",
    "email" => "john@example.com"
  }

```
Twitter
```json
{
  :provider => "twitter",
  :uid => "123456",
  :info => {
    :nickname => "johnqpublic",
    :name => "John Q Public"
  },
  :extra => {
    :raw_info => {
      :screen_name => ""
      }
    }
  }
}
```
Facebook
```json 
{
  provider: 'facebook',
  uid: '1234567',
  info: {
    email: 'joe@bloggs.com',
  },  
  extra: {
    raw_info: {
      username: 'jbloggs'
    }
  }
}
```