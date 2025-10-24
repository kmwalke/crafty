# Pin npm packages by running ./bin/importmap

pin 'application'
pin '@hotwired/stimulus', to: 'stimulus.min.js'
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js'
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin '@hotwired/turbo-rails', to: '@hotwired--turbo-rails.js' # @8.0.18
pin 'react-dom' # @19.2.0
pin '@hotwired/turbo', to: '@hotwired--turbo.js' # @8.0.18
pin '@rails/actioncable/src', to: '@rails--actioncable--src.js' # @8.0.300
pin 'react' # @19.2.0
pin '@hotwired/stimulus', to: 'stimulus.min.js'
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js'
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin '@hotwired/turbo-rails', to: 'turbo.min.js'
