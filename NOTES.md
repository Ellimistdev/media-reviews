## TODO
[x] propagate user|media associations through to media elements
  - i.e. episode.viewers should return list of viewers, currently need to call episode.medium.viewers  

[x] create sessionsController  
[x] create usersController  
[x] add local auth  
[x] add omniauth  
  - [x] add facebook  
    [x] add google  
    [x] add twitter  

[ ] create mediaController  
[x] add routes  



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


- [ ] Include nested resource show or index (URL e.g. users/2/reviews)
- [ ] Include nested resource "new" form (URL e.g. media/series/1/season/new)
- [ ] Include form display of validation errors (form URL e.g. /media/movies/new)


GOOGLE  
{  
  "provider" => "google_oauth2",  
  "uid" => "100000000000000000000",  
  "info" => {  
    "name" => "John Smith",  
    "email" => "john@example.com"     
  }  
}

TWITTER  
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
  
FACEBOOK  
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