import "bootstrap";
import flatpickr from 'flatpickr';
import 'flatpickr/dist/themes/airbnb.css';
import { addFilterListen } from '../components/selector_filter';
import { showNewLender } from '../components/new_loans';



// page loans index
addFilterListen();

// page loans/new
showNewLender();
flatpickr(".datepicker", {
  dateFormat: "d.m.Y"
});

