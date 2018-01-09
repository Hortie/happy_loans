
var withQuery = require('with-query');
var assert = require('assert');


function addFilterListen() {
  const e = document.getElementById("sdate");
  if(e){e.addEventListener("change", listenChangeDate);}
  // const f = document.getElementById("ki-choice");
  // if(f){f.addEventListener("change", listenChange);}
}

const listenChangeDate = (element) => {
  console.log(element.target.value);
  const sdate = element.target.value;
  const url = "http://localhost:3000/loans?" + $.param({sdate: sdate, baz: "kuuq"});
  console.log(url);
}

function sendParams(data) {
   form.submit();
}






const listenClick = (element) => {
  console.log(element.target.value);
};



const fetchIt = (event) => {
  // do something
};



export { addFilterListen } ;
