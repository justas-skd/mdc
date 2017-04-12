Rails.application.routes.draw do

  resources :suppliers do
    resources :products
  end
  scope "(:locale)", :locale => /en|lt/ do
     root :to => 'suppliers#index'
    #  get '/suppliers' => 'suppliers#index', as: :suppliers
  end
  # root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
