# Shopify Intern Challenge Inventory Tracker

A small rails inventory tracking web app with current weather and thumbnail images. 

## Requirements:
* Ruby 2.6.0
* Rails 6.1.4
* ImageMagick for creating image thumbnail variants. Which you can install with Homebrew... '$ brew install Imagemagick'


## Setup:
Download and move into repository: 

	> git clone https://github.com/robbinsjake/inventoryapp
	> cd inventoryapp

Obtain API KEY:

- You will need an API key from OpenWeatherApp: https://openweathermap.org/

- Modify or replace the .env file to include your API key. It should read as follows:
  API_KEY = "REPLACE_WITH_YOUR_KEY"


The seeds.rb file contains the 5 cities an inventory item can belong to, which youm.

Run:

	> bundle install
	> rake db:create
	> rake db:migrate
	> rake db:seed
	> rails s

The project is now running on http://localhost:3000


## Features
- Create/show/edit/delete itinerary items with a name, item description, quantity, city location and image(s).
- Item parameters validated. Images optional.
- Index shows a list of all created items including a small textual description of the current weather for the city the item is located in, and generated thumbnails of the uploaded photo(s).

## Areas for improvement...
- The API for current weather is called for each item in the list, redundantly calling data on the same city multiple times when many items share the same city. If there were 10000 items in the itinerary, there would 10000 calls. Some kind of caching should  be implemented.
- API is called naively with city names, e.g. 'Vancouver', which works for the demo but doesn't differentiate between cities of same name such as London UK and London Canada. Cities model could hold more info; region, country, longitute/latitude for more exact city identification
- Presently designed so that a stock of an item resides in a single city. Could expand so that an item has quantities spread across multiple cities/warehouses/locations
- Limit the number of images attachable to an item.
- Security considerations
- Images stored locally for this project could be stored using Amazon s3 or similar services.
- error handling: incorrect API key breaks webapp