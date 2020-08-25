require_relative '../router'

Routes = Router.new
Routes.add_route(method: 'GET', path: '/', handler: 'HomeController#index')
Routes.add_route(method: 'POST', path: '/', handler: 'HomeController#create')
Routes.add_route(method: 'GET', path: '/posts', handler: 'PostsController#index')
Routes.add_route(method: 'GET', path: '/posts/new', handler: 'PostsController#new')
Routes.add_route(method: 'POST', path: '/posts', handler: 'PostsController#create')
