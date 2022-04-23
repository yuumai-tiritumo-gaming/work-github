Rails.application.routes.draw do

devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :public, path: '/' do
    root to:  "items#top"
    resources "items",                        only: [:show,:index]
    get       "/about"                        => "items#about"
    get       "/customer/confirmation"        => "customers#confirmation"
    get       "/mypage"                       => "customers#show"
    patch     "/mypage"                       => "customers#unsubscribe"
    resource  "customers", path: '/customer', only: [:edit,:update]
    resources "addresses",                    only: [:index,:edit,:create,:destroy,:update]
    get       "/orders/conform"               => "orders#conform"
    resources "orders",                       only: [:index,:show,:new,:create]
    post       "/orders/check"                => "orders#check"
    delete    "/cart_items/clear"             => "cart_items#clear"
    resources "cart_items",                   only: [:index,:create,:destroy,:update]
  end


namespace :admin do
  get       "/"      => "orders#index"
  resources "orders",      only: [:show,:update]
  resources "order_items", only: [:update]
  resources "genres",      only: [:index,:create,:edit,:update]
  resources "customers",   only: [:index,:show,:edit,:update]
  resources "items",       except: :destroy
  end

end
