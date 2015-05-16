Rails.application.routes.draw do

  root 'site/home#index'

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, path: 'auth',
  path_names:    {
    sign_in:       '',
    sign_out:      'sair',
    password:      'senha',
    confirmation:  'verificacao',
    unlock:        'desbloquear',
    registration:  'entrar',
    sign_up:       ''
  },
  controllers:   {
    sessions:      'site/auth/sessions',
    registrations: 'site/auth/registrations'
  }

  scope module: 'site' do

    #    Produtos
    get  '/produtos'          => 'products#index',      as: :products
    get  '/produtos/:id'      => 'products#show',       as: :product

    #    Categorias
    get  '/categorias'        => 'categories#index',    as: :categories
    get  '/categorias/:id'    => 'categories#show',     as: :category

    #    Subcategorias
    get  '/subcategorias'     => 'subcategories#index', as: :subcategories
    get  '/subcategorias/:id' => 'subcategories#show',  as: :subcategory

    #    Páginas
    get  '/paginas'           => 'pages#index',         as: :pages
    get  '/paginas/:id'       => 'pages#show',          as: :page

    #    Pedidos
    get  '/meus-pedidos'     => 'orders#index', as: :orders
    get  '/pedido/:id' => 'orders#show',  as: :order
    post '/pedido'     => 'orders#create'

    # Produtos de pedidos
    get    '/produtos-pedidos'            => 'product_orders#index',  as: :product_orders
    post   '/produtos-pedidos'            => 'product_orders#create'
    get    '/produtos-pedidos/novo'       => 'product_orders#new',    as: :new_product_order
    get    '/produtos-pedidos/:id/editar' => 'product_orders#edit',   as: :edit_product_order
    get    '/produtos-pedidos/:id'        => 'product_orders#show',   as: :product_order
    patch  '/produtos-pedidos/:id'        => 'product_orders#update'
    put    '/produtos-pedidos/:id'        => 'product_orders#update'
    delete '/produtos-pedidos/:id'        => 'product_orders#destroy'

    # Carrinho de compra
    get    '/carrinho'            => 'carts#index',  as: :carts
    post   '/carrinho'            => 'carts#create'
    get    '/carrinho/novo'       => 'carts#new',    as: :new_cart
    get    '/carrinho/:id/editar' => 'carts#edit',   as: :edit_cart
    get    '/carrinho/:id'        => 'carts#show',   as: :cart
    patch  '/carrinho/:id'        => 'carts#update'
    post   '/carrinho/:id'        => 'carts#update'
    delete '/carrinho/:id'        => 'carts#destroy'
    get    '/carrinho-contagem'   => 'carts#index_count'

    # Usuários
    get    '/usuarios'            => 'users#index',  as: :users
    post   '/usuarios'            => 'users#create'
    get    '/usuarios/novo'       => 'users#new',    as: :new_user
    get    '/usuarios/:id/editar' => 'users#edit',   as: :edit_user
    get    '/usuarios/:id'        => 'users#show',   as: :user
    patch  '/usuarios/:id'        => 'users#update'
    put    '/usuarios/:id'        => 'users#update'
    delete '/usuarios/:id'        => 'users#destroy'

    # Frete
    post    '/calcula-frete'       => 'freight#calc'

  end

  namespace :admin do

    # Produtos
    get    '/produtos'            => 'products#index',  as: :products
    post   '/produtos'            => 'products#create'
    get    '/produtos/novo'       => 'products#new',    as: :new_product
    get    '/produtos/:id/editar' => 'products#edit',   as: :edit_product
    get    '/produtos/:id'        => 'products#show',   as: :product
    patch  '/produtos/:id'        => 'products#update'
    put    '/produtos/:id'        => 'products#update'
    delete '/produtos/:id'        => 'products#destroy'

    # Categorias
    get    '/categorias'            => 'categories#index',  as: :categories
    post   '/categorias'            => 'categories#create'
    get    '/categorias/novo'       => 'categories#new',    as: :new_category
    get    '/categorias/:id/editar' => 'categories#edit',   as: :edit_category
    get    '/categorias/:id'        => 'categories#show',   as: :category
    patch  '/categorias/:id'        => 'categories#update'
    put    '/categorias/:id'        => 'categories#update'
    delete '/categorias/:id'        => 'categories#destroy'

    # Subcategorias
    get    '/subcategorias'            => 'subcategories#index',  as: :subcategories
    post   '/subcategorias'            => 'subcategories#create'
    get    '/subcategorias/novo'       => 'subcategories#new',    as: :new_subcategory
    get    '/subcategorias/:id/editar' => 'subcategories#edit',   as: :edit_subcategory
    get    '/subcategorias/:id'        => 'subcategories#show',   as: :subcategory
    patch  '/subcategorias/:id'        => 'subcategories#update'
    put    '/subcategorias/:id'        => 'subcategories#update'
    delete '/subcategorias/:id'        => 'subcategories#destroy'

    # Páginas
    get    '/paginas'            => 'pages#index',  as: :pages
    post   '/paginas'            => 'pages#create'
    get    '/paginas/novo'       => 'pages#new',    as: :new_page
    get    '/paginas/:id/editar' => 'pages#edit',   as: :edit_page
    get    '/paginas/:id'        => 'pages#show',   as: :page
    patch  '/paginas/:id'        => 'pages#update'
    put    '/paginas/:id'        => 'pages#update'
    delete '/paginas/:id'        => 'pages#destroy'

    # Endereços
    get    '/enderecos'            => 'addresses#index',  as: :addresses
    post   '/enderecos'            => 'addresses#create'
    get    '/enderecos/novo'       => 'addresses#new',    as: :new_address
    get    '/enderecos/:id/editar' => 'addresses#edit',   as: :edit_address
    get    '/enderecos/:id'        => 'addresses#show',   as: :address
    patch  '/enderecos/:id'        => 'addresses#update'
    put    '/enderecos/:id'        => 'addresses#update'
    delete '/enderecos/:id'        => 'addresses#destroy'

    # Pedidos
    get    '/pedidos'            => 'orders#index',  as: :orders
    post   '/pedidos'            => 'orders#create'
    get    '/pedidos/novo'       => 'orders#new',    as: :new_order
    get    '/pedidos/:id/editar' => 'orders#edit',   as: :edit_order
    get    '/pedidos/:id'        => 'orders#show',   as: :order
    patch  '/pedidos/:id'        => 'orders#update'
    put    '/pedidos/:id'        => 'orders#update'
    delete '/pedidos/:id'        => 'orders#destroy'

    # Produtos de pedidos
    get    '/produtos-pedidos'            => 'product_orders#index',  as: :product_orders
    post   '/produtos-pedidos'            => 'product_orders#create'
    get    '/produtos-pedidos/novo'       => 'product_orders#new',    as: :new_product_order
    get    '/produtos-pedidos/:id/editar' => 'product_orders#edit',   as: :edit_product_order
    get    '/produtos-pedidos/:id'        => 'product_orders#show',   as: :product_order
    patch  '/produtos-pedidos/:id'        => 'product_orders#update'
    put    '/produtos-pedidos/:id'        => 'product_orders#update'
    delete '/produtos-pedidos/:id'        => 'product_orders#destroy'

    # Carrinho de compra
    get    '/carrinho'            => 'carts#index',      as: :carts
    post   '/carrinho'            => 'carts#create'
    get    '/carrinho/novo'       => 'carts#new',        as: :new_cart
    get    '/carrinho/:id/editar' => 'carts#edit',       as: :edit_cart
    get    '/carrinho/:id'        => 'carts#show',       as: :cart
    patch  '/carrinho/:id'        => 'carts#update'
    put    '/carrinho/:id'        => 'carts#update'
    delete '/carrinho/:id'        => 'carts#destroy'

    # Menu
    get    '/menus'            => 'menus#index',  as: :menus
    post   '/menus'            => 'menus#create'
    get    '/menus/novo'       => 'menus#new',    as: :new_menu
    get    '/menus/:id/editar' => 'menus#edit',   as: :edit_menu
    get    '/menus/:id'        => 'menus#show',   as: :menu
    patch  '/menus/:id'        => 'menus#update'
    put    '/menus/:id'        => 'menus#update'
    delete '/menus/:id'        => 'menus#destroy'

    # Usuários
    get    '/usuarios'            => 'users#index',  as: :users
    post   '/usuarios'            => 'users#create'
    get    '/usuarios/novo'       => 'users#new',    as: :new_user
    get    '/usuarios/:id/editar' => 'users#edit',   as: :edit_user
    get    '/usuarios/:id'        => 'users#show',   as: :user
    patch  '/usuarios/:id'        => 'users#update'
    put    '/usuarios/:id'        => 'users#update'
    delete '/usuarios/:id'        => 'users#destroy'
    get    '/clientes'            => 'users#clients',  as: :clients

  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
