# TODO
## models
[x] propagate user|media associations through to media elements
  - i.e. episode.viewers should return list of viewers, currently need to call episode.medium.viewers  
## controllers
- [x] add routes  
- [x] add local auth  
- [x] add omniauth  
  - [x] add facebook  
  - [x] add google  
  - [x] add twitter  
- [x] create SessionsController  
- [x] create UsersController  
- [x] BUG User creation: uniqueness is enforced on nil values  
- [x] create ReviewsController  
  - [x] adding review should mark media as viewed for reviewer
- [x] create ViewsController  
- [x] create MediaController  
  - [x] show action should detect the media type and route to the approprate path
- [x] create MoviesController  
- [x] create SeasonsController  
- [x] create SeriesController  
- [x] create EpisodesController  
## views
- [x] create social login partial  
- [x] add facebook to social_partial  
- [x] add google to social_partial  
- [x] add twitter to social_partial  
- [x] add social_partial to login  
- [x] add social_partial to signup  
- [x] create media views
  - [x] Index
    - [x] Shows links for movies, series 
  - [x] Show
    - [x] shows a single media element
    - [x] its reviews
    - [x] new review form
    - [x] links to parents
    - [x] children
    - [x] mark viewed for current_user
    - [x] links to create new children
  - [x] Index
    - [x] lists all media in scope
  - [x] Movies
    - [x] New  
      - [x] new media form
  - [x] Series    
    - [x] New  
      - [x] new media form
  - [x] Seasons    
    - [x] New  
      - [x] new media form
  - [x] Episodes    
    - [x] New  
      - [x] new media form
- [x] create view views
  - [x] Index  
      - [x] has links to all media a user has marked viewed
- [x] create review views
  - [x] Index
    - [x] lists all reviews by user with links to reviewed media
  - [x] Edit
    - [x] edit review form
- [x] User views
  - [x] Show
    - [x] Should link to user reviews, views,
    - [x] Don't display user email

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