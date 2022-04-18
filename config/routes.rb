Rails.application.routes.draw do

  namespace :admin do
    get 'genres/index'
    get 'genres/create'
    get 'genres/edit'
    get 'genres/update'
  end
  namespace :admin do
    get 'order_items/update'
  end
  namespace :public do
    get 'cart_items/index'
    get 'cart_items/create'
    get 'cart_items/clear'
    get 'cart_items/destroy'
    get 'cart_items/update'
  end
  namespace :admin do
    get 'orders/show'
    get 'orders/index'
    get 'orders/update'
  end
  namespace :public do
    get 'orders/show'
    get 'orders/index'
    get 'orders/new'
    get 'orders/check'
    get 'orders/create'
  end
  namespace :public do
    get 'addresses/index'
    get 'addresses/create'
    get 'addresses/destroy'
    get 'addresses/edit'
    get 'addresses/update'
  end
  namespace :admin do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/index'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/confirmation'
    get 'customers/unsubscribe'
  end
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}



end
