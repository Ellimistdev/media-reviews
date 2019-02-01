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
- [ ] create media views
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
  - [ ] Movies
    - [ ] New  
      - [ ] new media form
  - [ ] Series    
    - [ ] New  
      - [ ] new media form
  - [ ] Seasons    
    - [ ] New  
      - [ ] new media form
  - [ ] Episodes    
    - [ ] New  
      - [ ] new media form
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
## user reviews | views
action | method | reviews route | views route
-|-|-|-
index | get | /users/:user_id/reviews | /users/:user_id/views
create | post | /reviews | /views 
destroy | delete | /reviews/:id | /views/:id
edit | get | /reviews/:id/edit | 
update | patch | /reviews/:id | 


## media
action | method | route
-|-|-
show | get | /media/:id (redirects to show path below)

action | method | movie route | series route | season route | episode route | 
-|-|-|-|-|-
index | get | /movies | /series | /series/:series_id/seasons | /series/:series_id/seasons/:season_id/episodes
create | post | /movies | /series | /seasons | /episodes
new | get | /movies/new | /series/new | /seasons/new | /episodes/new
show | get | /movies/:id | /series/:id | /seasons/:id | /episodes/:id

not accounted for:  
- viewing an individual review  
  - e.g. get media/movies/:id/reviews/:id || get users/:id/reviews/:id




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