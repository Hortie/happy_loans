function showNewLender() {
  // preteur
  const e = document.getElementById('lender1');
  if(e){e.addEventListener("change", (event) => {
    if (e.value == "Autre") {
      document.getElementById('lender2').value = "";
      document.getElementById('divlender2').classList.remove("hidden");
    } else {
      document.getElementById('lender2').value = e.value;
      document.getElementById('divlender2').classList.add("hidden");
    }
  });}
  // emprunteur
    const b = document.getElementById('borrower1');
    if(b){b.addEventListener("change", (event) => {
    if (b.value == "Autre") {
      document.getElementById('borrower2').value = "";
      document.getElementById('divborrower2').classList.remove("hidden");
    } else {
      document.getElementById('borrower2').value = b.value;
      document.getElementById('divborrower2').classList.add("hidden");
    }
  });}
}

export { showNewLender };
