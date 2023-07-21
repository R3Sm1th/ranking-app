// window.onload = function() {
//   console.log("path name:");
//   console.log(window.location.pathname);
//   if (window.location.pathname == '/browse') {
//     console.log("connected to browse")
//     const list = document.querySelector("#results")

//     const detailedView = (data) => {
//       const details =
//       `<div class="inner-modal">
//         <h1>${data.Title}</h1>
//         <img src='${data.Poster}'></img>
//         <div class="infos">
//           <p><strong>Release Date:</strong> ${data.Released}</p>
//           <p><strong>Runtime:</strong>  ${data.Runtime}</p>
//           <p><strong>Rating:</strong>  ${data.Rated}</p>
//           <p><strong>Genre:</strong>  ${data.Genre}</p>
//         </div>
//         <div class="actors">
//           <p><strong>Director:</strong>${data.Director}</p>
//           <p><strong>Writer:</strong>${data.Writer}</p>
//           <p><strong>Actors:</strong>${data.Actors}</p>
//         </div>
//         <div class="plot">
//           <p>Plot</p>
//           <p>${data.Plot}</p>
//         </div>
//         <div class="infos">
//           <p><strong>Awards: </strong>${data.Awards}</p>
//         </div>
//         <div class="score">
//           <div>
//             <p>${data.Metascore}</p>
//           </div>
//           <div>
//             <p>${data.imdbRating}</p>
//           </div>
//         </div>
//         <div class="actors">
//           <p><strong>Website: </strong>${data.Website}</p>
//         </div>
//       </div>`;
//       return details
//     };

//     const fetchMovieData = async (query) => {
//       const response = await fetch(`https://www.omdbapi.com/?apikey=adf1f2d7&i=${query}`);
//       const data = await response.json();
//       return data;
//     };
//     const insertMovies = (data) => {
//       data.Search.forEach((result) => {
//         const movieTag = `<div class="card">
//           <img src="${result.Poster}" alt="">
//           <div class="content">
//             <h6> ${result.Title} </h6>
//             <p> Release Year: ${result.Year} </p>
//             <button type="button" class="btn btn-primary modal-btn" data-bs-toggle="modal" data-bs-target="#exampleModal" data-imdbid="${result.imdbID}">
//               More Info
//             </button>
//           </div>
//         </div>`;
//         list.insertAdjacentHTML("beforeend", movieTag);
//       });

//       list.addEventListener("click", async (event) => {
//         const target = event.target;
//         // Check if the clicked element is the "More Info" button
//         if (target.classList.contains("modal-btn")) {
//           const imdbID = target.getAttribute("data-imdbid");
//           const modalContent = document.querySelector(".modal-body");
//           const movie = await fetchMovieData(imdbID);
//           modalContent.innerHTML = detailedView(movie);
//         }
//       });
//     };

//     // const setupModalButtonClickListeners = () => {
//     //   const modalContent = document.querySelector(".modal-body");
//     //   const movieData = document.querySelectorAll(".modal-btn");

//     //   movieData.forEach((element) => {
//     //     element.addEventListener("click", (event) => {
//       //       console.log("hello");
//       //       modalContent.innerText = "hello";
//       //     });
//       //   });
//       // };

//       const fetchMovies = (query) => {
//         fetch(`http://www.omdbapi.com/?s=${query}&apikey=adf1f2d7`)
//           .then(response => response.json())
//           .then(data => insertMovies(data))
//           // .then(() => setupModalButtonClickListeners());
//       }

//       const form = document.querySelector("#search-form")
//       form.addEventListener("submit", (event) => {
//         event.preventDefault()
//         list.innerHTML = ""
//         const input = document.querySelector("#search-input")
//         fetchMovies(input.value)
//       });

//       fetchMovies("harry potter");//....
// }};
