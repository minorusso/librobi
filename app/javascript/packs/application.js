require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import 'bootstrap';
import '../stylesheets/application';

require('jquery')
// require('../rails_admin.js')
window.$ = window.jQuery = require('jquery');
require('packs/raty')