# boston-employee-earnings-report

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
