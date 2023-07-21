import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "results", "movie", "display"]

  connect() {
    this.fetchMovies("harry potter")
  }

  fetchMovies(query) {
    fetch(`http://www.omdbapi.com/?s=${query}&apikey=adf1f2d7`)
      .then(response => response.json())
      .then(data => this.insertMovies(data))
  }

  insertMovies(data) {
    data.Search.forEach((result) => {
      const movieTag = `<div class="card">
                <img src="${result.Poster}" alt="">
                <div class="content">
                  <h6> ${result.Title} </h6>
                  <p> Release Year: ${result.Year} </p>
                  <button type="button" class="btn btn-primary modal-btn" data-bs-toggle="modal" data-bs-target="#exampleModal" data-action="click->movies#more" data-movies-target="movie" data-imdbid="${result.imdbID}">
                    More Info
                  </button>
                </div>
              </div>`;
      this.resultsTarget.insertAdjacentHTML("beforeend", movieTag)
    })
  }

  search(event) {
    event.preventDefault()
    this.resultsTarget.innerHTML = ""
    this.fetchMovies(this.inputTarget.value)
  }

  detailedView(data) {
    const details =
    `<div class="inner-modal">
      <h1>${data.Title}</h1>
      <img src='${data.Poster}'></img>
      <div class="infos">
        <p><strong>Release Date:</strong> ${data.Released}</p>
        <p><strong>Runtime:</strong>  ${data.Runtime}</p>
        <p><strong>Rating:</strong>  ${data.Rated}</p>
        <p><strong>Genre:</strong>  ${data.Genre}</p>
      </div>
      <div class="actors">
        <p><strong>Director:</strong>${data.Director}</p>
        <p><strong>Writer:</strong>${data.Writer}</p>
        <p><strong>Actors:</strong>${data.Actors}</p>
      </div>
      <div class="plot">
        <p>Plot</p>
        <p>${data.Plot}</p>
      </div>
      <div class="infos">
        <p><strong>Awards: </strong>${data.Awards}</p>
      </div>
      <div class="score">
        <div>
          <img src="https://res.cloudinary.com/dcu7y5wnn/image/upload/v1689929621/Metacritic_spyctc.png"></img>
          <p>${data.Metascore}</p>
        </div>
        <div>
          <img src="https://res.cloudinary.com/dcu7y5wnn/image/upload/v1689929978/613f661716381700041030fc_l9k9hz.png"></img>
          <p>${data.imdbRating}</p>
        </div>
      </div>
      <div class="actors">
        <p><strong>Website: </strong>${data.Website}</p>
      </div>
    </div>`;
    return details
  };

  fetchMovieData(query) {
    const response = fetch(`https://www.omdbapi.com/?apikey=adf1f2d7&i=${query}`);
    const data = response.json();
    return data;
  }

  more(event) {
    event.preventDefault()
    const movie = this.movieTarget.getAttribute('data-imdbid')
    // this.fetchMovieData(movie)
    // belo works to get movie data
    console.log(movie);
    // below is the inner text i need to change
    console.log(this.displayTarget);
    // this.fetchMovieData(this.inputTarget.value)
  }
}
