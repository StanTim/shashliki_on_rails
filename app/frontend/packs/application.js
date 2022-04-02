import Rails from "@rails/ujs"
import "bootstrap/dist/js/bootstrap"

import "../styles/application.scss"
import Lightbox from 'bs5-lightbox'

Rails.start()

const images = require.context("../images", true)

require("jquery")

// document.querySelectorAll('.my-lightbox-toggle').forEach((el) => el.addEventListener('click',
//   (e) => {
//     e.preventDefault();
//     const lightbox = new Lightbox(el);
//     lightbox.show();
//   }));