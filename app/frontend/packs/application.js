import Rails from "@rails/ujs"

import "bootstrap/dist/js/bootstrap"

import "../styles/application.scss"
import "../styles/lightbox.css"

import "./lightbox"

Rails.start()

const images = require.context("../images", true)

require("jquery")
