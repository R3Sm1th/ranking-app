console.log("connected")
const list = document.querySelector("#results")

const detailedView = (data) => {
  return `<p>${data.Title}</p>`;
};

const fetchMovieData = async (query) => {
  const response = await fetch(`https://www.omdbapi.com/?apikey=adf1f2d7&i=${query}`);
  const data = await response.json();
  return data;
};
const insertMovies = (data) => {
  data.Search.forEach((result) => {
    const movieTag = `<div class="card">
      <img src="${result.Poster}" alt="">
      <div class="content">
        <h6> ${result.Title} </h6>
        <p> Type: ${result.Type} </p>
        <p> Release Year: ${result.Year} </p>
        <button type="button" class="btn btn-primary modal-btn" data-bs-toggle="modal" data-bs-target="#exampleModal" data-imdbid="${result.imdbID}">
          More Info
        </button>
      </div>
    </div>`;
    list.insertAdjacentHTML("beforeend", movieTag);
  });

  list.addEventListener("click", async (event) => {
    const target = event.target;
    // Check if the clicked element is the "More Info" button
    if (target.classList.contains("modal-btn")) {
      const imdbID = target.getAttribute("data-imdbid");
      const modalContent = document.querySelector(".modal-body");
      const movie = await fetchMovieData(imdbID);
      modalContent.innerText = detailedView(movie);
    }
  });
};

// const setupModalButtonClickListeners = () => {
//   const modalContent = document.querySelector(".modal-body");
//   const movieData = document.querySelectorAll(".modal-btn");

//   movieData.forEach((element) => {
//     element.addEventListener("click", (event) => {
//       console.log("hello");
//       modalContent.innerText = "hello";
//     });
//   });
// };

const fetchMovies = (query) => {
  fetch(`http://www.omdbapi.com/?s=${query}&apikey=adf1f2d7`)
    .then(response => response.json())
    .then(data => insertMovies(data))
    // .then(() => setupModalButtonClickListeners());
}

fetchMovies("harry potter") // on 1st page load

const form = document.querySelector("#search-form")
form.addEventListener("submit", (event) => {
  event.preventDefault()
  list.innerHTML = ""
  const input = document.querySelector("#search-input")
  fetchMovies(input.value)
});
