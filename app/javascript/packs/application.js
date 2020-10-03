require("@rails/ujs").start();
require ("bootstrap/dist/js/bootstrap")

import '../scripts/map'
import '../scripts/lightbox.min'

import '../styles/application'

const images = require.context('../images', true)
