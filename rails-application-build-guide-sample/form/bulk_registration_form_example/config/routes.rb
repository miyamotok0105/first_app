Rails.application.routes.draw do
  get 'outjson/hello'
  # get 'outjson'
  # get "outjson/:id" => "outjson#show", defaults: { format: "json" }
  get "outjson/show" => "outjson#show", defaults: { format: "json" }

  # resources :outjson, defaults: { format: "json" }


  root 'products#index'


  resources :ibento, only: [:index] do

    collection do
      get :search
    end
  end

  resources :products, only: [:index, :new, :create] do
    collection do
      get :search
    end
  end


#product2はエラーになってる。
#もうちょっと成長したら、下記をメニューに貼って再開
#<%= navlink('商品検索2', product2_path, :products2, [:index, :search]) %>
  resources :products2, only: [:index, :new, :create] do
    collection do
      get :search
    end
  end

  # match 'hello' => 'outjson#hello'

end
