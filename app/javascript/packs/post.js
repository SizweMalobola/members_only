const tableRowLinks = document.querySelectorAll("tr[data-link]");
tableRowLinks.forEach((tr) => {
  tr.addEventListener("click", (e) => {
    window.location = e.currentTarget.dataset.link;
  });
});
