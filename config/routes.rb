Socialfreight::Application.routes.draw do

  get "air" => "home#air", :as => "air"
  get "sea" => "home#sea", :as => "sea"
  get "road" => "home#road", :as => "road"
  get "rail" => "home#rail", :as => "rail"
  get "inland" => "home#inland", :as => "inland"

  %w[roadmap security features services aboutus].each do |page|
    get page, controller: "home", action: page
  end

  mount Nimbos::Engine, at: "/"
  mount Resque::Server, at: "/resque"
  mount Blogger::Engine, at: "/blog"
  mount Assetim::Engine, at: "/assetim"
  mount Helpdesk::Engine, at: "/helpdesk"
  mount Personal::Engine, at: "/"
  mount Logistics::Engine, at: "/"
  mount Network::Engine, at: "/"
  mount Arsiv::Engine, at: "/"
  mount Fleet::Engine, at: "/"
  mount Roster::Engine, at: "/"
  mount Surveyor::Engine, at: "/"
  mount Messenger::Engine, at: "/"

  root :to => "home#index"
end
