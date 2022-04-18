Rails.application.routes.draw do

devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :public, path: '/' do
    root to: "items#top"
    resources "items",                       only: [:show,:index]
    get       "/about"                       => "items#about"
    get       "/mypage/confirmation"         => "items#confirmation"
    patch     "/mypage/confirmation"         => "items#unsubscribe"
    resource  "customers", path: '/mypage',  only: [:show,:edit,:update]
    resources "addresses",                   only: [:index,:edit,:create,:destroy,:update]
    resources "orders",                      only: [:index,:show,:new,:create]
    get       "/orders/check"                => "orders#check"
    resources "cart_items",                  only: [:index,:create,:destroy,:update]
    delete    "/cart_items"                  => "cart_items#clear"
  end


namespace :admin do
  resources "orders",      only: [:index,:show,:update]
  resources "order_items", only: [:update]
  resources "genres",      only: [:index,:create,:edit,:update]
  resources "customers",   only: [:index,:show,:edit,:update]
  resources "items",       except: :destroy
  end

end
