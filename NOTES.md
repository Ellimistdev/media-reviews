## TODO
[x] propagate user|media associations through to media elements
  - i.e. episode.viewers should return list of viewers, currently need to call episode.medium.viewers  

[x] create sessionsController  
[x] create usersController  
[x] add local auth  
[ ] add omniauth  
  - [ ] add facebook  
    [ ] add google  
    [ ] add twitter  

[ ] create mediaController  
[ ] add routes  

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