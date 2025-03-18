### TMDB Performance Test

This repository contains a basic load test suite for the following TMDB API endpoint:
- [get-top-rated-movies](https://developers.themoviedb.org/3/movies/get-top-rated-movies)

The suite is built using [Locust](https://locust.io/). It contains a few preset configurations for some types of load tests:
- Spike
- Linear
- Soak
- Endurance

All of these presets use a relatively small amount of users, as to not cause too much unwanted traffic on TMDB's API.


[Example HTML report of a spike test](https://github.com/evitiska/TMDB-performance-test/blob/main/reports/example-report-spike.html)


### Running the tests
---

After cloning this repository there are few options how to run the tests: 

#### Prerequisite
Set up the configuration values for the API key and URL in a .env file at the project root, such that the file contains at least these two:
```
TMDB_API_KEY=**********
TMDB_API_URL=https://api.themoviedb.org/3
```


## 1. Run Tests in a Docker Container (headless)
* Build the Docker image, for example `docker build -t tmdb-performance-test .`
* Run the tests in a container `docker run tmdb-performance-test` (add `--rm` to remove container after run)
* Pass Locust [configuration options](https://docs.locust.io/en/stable/configuration.html) or use a preset such as `linear` (`--config configuration/linear.conf`)
* You can extract the report by using a Docker bind mount to the `reports` folder, such as `-v $(pwd)/reports:/app/reports`

## 2. Run Tests Manually (headed)
* Install dependencies `pip install -r requirements.txt`
* Pass Locust [configuration options](https://docs.locust.io/en/stable/configuration.html) or use a preset such as `linear` (`--config configuration/linear.conf`) `locust`
* Locust starts a local web server, you can see the port in the log, such as `http://localhost:8089`
* Run a test according to your specification, read the charts, and export a report

## 2. Run Tests Manually (headless)
* Install dependencies `pip install -r requirements.txt`
* Pass Locust [configuration options](https://docs.locust.io/en/stable/configuration.html) or use a preset such as `linear` (`--config configuration/linear.conf`) `locust --headless`
* Locust runs the tests in the terminal, and provides the report in the `reports` folder (if using a preset configuration, otherwise pass a `html` argument specifying the report location)
