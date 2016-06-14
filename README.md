# Tasiemka - Best YouTube content

*Tasiemka* is a aggregator site that collect the best video material from YouTube.

Application allows users to search and watch quality video material. Users can easily look at valuable video. They do not have to waste time for searching. 
Check this site on: http://tasiemka.info/


# Functionalities

#### Core:
* play YouTube video
* search through almost 150 valuable yt channels
* change layout depend your preferences
* ranking videos 
* search for channels

#### Future improvements:
* search by tags
* voting system
* add your channel


# Technologies

#### Core:
* `Ruby [2.3.1]`
* `Rails [4.2.0]`
* `ReactJs` [frontend]
* `Postgres` [database]

#### Other:
* `Bootstrap` [Frontend framework]
* `yt` [youtube integration]
* `Carrierwave` [image upload system]
* `Cloudinary` [image cloud storage]

# Setup

#### Source code

Clone the repo (`git clone git@github.com:Panczo/tasiemka.git` ).

#### Database

Copy the database config file (and edit if needed): 
` cp config/database.yml.example config/database.yml`

Setup the database:
`bin/rake db:setup`

#### Secrets

Define your `secrets.yml` file and format your data like that (see `config.yml` as an example):
```
# config/secrets.yml
ytapiid: 123
  ```

*Note*: In order to use Youtube authentication you need to have accountin this platform. 

```
bundle install
rails s
```

*Note*: To configure react-rails gem look at official repo.
