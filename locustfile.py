from locust import HttpUser, task, between
from dotenv import load_dotenv
import os
import random

load_dotenv()

class TMDBUser(HttpUser):
    wait_time = between(1, 2)
    
    api_key = os.getenv("TMDB_API_KEY")
    host = os.getenv("TMDB_API_URL")
    
    @task
    def get_top_rated_movies(self):
        page_number = random.randint(1, 10)
        url = f"/movie/top_rated?api_key={self.api_key}&page={page_number}"
        response = self.client.get(url)
        assert response.status_code == 200, f"Endpoint movie/top_rated returned status code {response.status_code}"
        