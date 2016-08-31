# boston-employee-earnings-report

A simple web API using the 2014 Boston Employee Earnings Report. When given a job title, it will respond with the average salary for that position (HTML or JSON).

All data is provided by https://dev.socrata.com/foundry/data.cityofboston.gov/ntv7-hwjm

Coding challenge for Teikametrics

## Getting Started

```no-highlight
# Clone down this template
git clone  <YOUR_APP_NAME>

# Move into your app's directory
cd <YOUR_APP_NAME>

# Install all the gems
bundle install

# Run the server
rackup

# Open the page
http://localhost:9292/
```

## JSON request

* Default response is HTML, to make a JSON request include ```Accept``` headers
  * example: ```curl -X GET -H "Accept: application/json" "http://localhost:9292/" ```

## Boston Employee Job titles

The home page is a unique list of all the Boston employee job titles. Clicking on one of the links would bring you to the show page where the average salary for that position is displayed.

* **URL:**
  `GET` http://localhost:9292/

## Average annual salary

A show page for the job title, with a list of all the partial matches for the job title, and an average total earnings for all the jobs listed.

* **URL:**
 `GET` http://localhost:9292/:title
* **URL Params required:** `title`
  * Example: http://localhost:9292/teacher
* **Success Response:**
  * {"title": "teacher", "average_earnings": 66357.64518910472}
* **Error Response:**
  * {"error": {"code":404,"message":"Job title not found"} }

## Technology Used

Application was built with Sinatra, and tests were done with RSpec, Capybara, and VCR for stubbing. Sinatra was used because of the simplicity of the application. If I had additional time, I would implement a search field on the index page that would should the details for the job title typed using AJAX. I would also add more thorough tests.

## Personal Links

* [LinkedIn](https://www.linkedin.com/in/huitommy)
* [Current Side Project](https://github.com/evanlouden/exReg)
