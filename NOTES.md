# TODO
## models
[x] propagate user|media associations through to media elements
  - i.e. episode.viewers should return list of viewers, currently need to call episode.medium.viewers  
## controllers
[x] add routes  
[x] add local auth  
[x] add omniauth  
  - [x] add facebook  
  - [x] add google  
  - [x] add twitter
  
[x] create sessionsController  
[x] create usersController  
[ ] create mediaController  
[ ] create viewController  
[ ] create reviewController 
## views
[ ] create social login partial  
[ ] add facebook to social_partial  
[ ] add google to social_partial  
[ ] add twitter to social_partial  
[ ] add social_partial to login  
[ ] add social_partial to signup  

- [ ] create media views
  - [ ] Custom_Index
    - Shows links for movies, series 
  - [ ] sub media
    - [ ] Index
      - lists all media in scope
    - [ ] Show
      - shows a single media element, its reviews, links to parents, children, mark viewed for current_user
    - [ ] New  
      - new media form
- [ ] create view views
  - [ ] Index  
      - has links to all media a user has marked viewed
- [ ] create review views
  - [ ] Index
    - lists all reviews by user with links to reviewed media
  - [ ] Edit
    - edit review form

# Routes
## user reviews | views
action | method | reviews route | views route
-|-|-|-
index | get | /users/:id/reviews | /users/:id/views
create | post | /reviews | /views 
destroy | delete | /reviews/:id | /views/:id
edit | get | /reviews/:id/edit | 
update | patch | /reviews/:id | 


## media
action | method | root
-|-|-
index | get | media

action | method | movie route | series route | season route | episode route | 
-|-|-|-|-|-
index | get | /movies | /series | /series/:id/seasons | /series/:id/seasons/:id/episodes
new | get | /movies/new | /series/new | /seasons/new | /episodes/new
create | post | /movies | /series | /seasons | /episodes
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