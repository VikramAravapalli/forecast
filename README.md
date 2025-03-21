# Weather Forecast (Ruby on Rails)

## Overview
This is a **Ruby on Rails Webapp** that provides real-time weather forecasts based on zip code for locations.
It uses weather data from **weatherapi**.

 Supports zip_code (e.g., `98018`)
 Fetches **temperature, high/low, and weather description**
 **Caches** results for **30 minutes** using Redis
 Includes **RSpec tests** for reliability

---
##**Technologies Used**
weatherapi: For weather forecast details which can parse zip_code, city names, lat and long co-ords.
Redis: An in-memory data structure store used for caching.

---
## **Usage**
Go to Hompage to see the weather forecast. enter zip_code to find the current tempratues.
1. when zip code is parsed as inputs
2. weatherapi fetchs the input given parses and returns forecast data for the given zip code
3. then parsed the returned json received.
4. the parsed data then cached and shown as output to web
5. the cached data is stored for 30mins

---

## 🛠️ setup

## **Prerequists**
```sh
install ruby and rails locally
```

### **Clone the Repository**
```sh
git clone <your-repo-url>
cd forecast
```

### **Install Dependencies**
```sh
bundle install
```

### **3️ Set Up Environment Variables**
- Add your ** weatherapi API Key** in Rails credentials:
```sh
edit api_secret_key in credentials.yml or into add new api key with key into api_secret_key .envs
```

### ** strating web application **
** Start Redis (For Caching)**
```sh
redis-server
```

** Run the Rails Server**
```sh
rails server
```
application will be running on port **`http://localhost:3000`**.

---

##  Running Tests
Run all RSpec tests:
```sh
rspec
```

---

##  License
This project is open-source and free to use.
 - the API used for fetching weather api has a limit to 7 days trail.
 - but has good swagger documentation

---

## Additional Points
 - TODO:(Pending)
   - Add location autocomplete using google autocomplete JS API
   - Temperature forecast map
   - auto find location using geocorder
   - add other forecast fields from api 

