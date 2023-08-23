import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "results", "select", "movie", 'movienamefield', 'movienameid' ]

  connect() {
    console.log("connected to submission controller");
  }

  fetchMovies(query) {
    fetch(`http://www.omdbapi.com/?s=${query}&apikey=adf1f2d7`)
      .then(response => response.json())
      .then(data => this.insertMovies(data))
  }

  insertMovies(data) {
    data.Search.forEach((result) => {
      const movieTag =
              `<div class="card-product">
                <img src="${result.Poster}" />
                <div class="card-product-infos">
                  <h2>${result.Title}</h2>
                  <p>${result.Year}</p>
                  <button
                    type="button"
                    class="btn btn-primary select-btn"
                    data-action="click->submission#select"
                    data-movies-target="movie"
                    data-imdbid="${result.imdbID}"
                    data-moviename="${result.Title}"
                  >
                    Select
                  </button>
                </div>
              </div>`
      this.resultsTarget.insertAdjacentHTML("beforeend", movieTag)
    })
  }

  search(event) {
    event.preventDefault()
    this.resultsTarget.innerHTML = ""
    this.fetchMovies(this.inputTarget.value)
  }

  select(event) {
    const movie = event.target.getAttribute('data-moviename');
    const id = event.target.getAttribute('data-imdbid');
    // this.movienamefieldTarget.innerText = movie;
    // this.movienameidTarget.innerText = id;
    // console.log(this.movieidfieldTarget.innerText);
    // console.log(movie);
    // console.log(id);
    // console.log(this.movienamefieldTarget)
    // console.log(this.movienameidTarget);
    this.movienamefieldTarget.value = movie
    this.movienameidTarget.value = id
    this.resultsTarget.innerHTML = ""
  }
}
