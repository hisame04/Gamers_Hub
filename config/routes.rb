Rails.application.routes.draw do

  resources :opponents_wanted_posts do
    resource :user_opponents_post_relations, only: [:create, :destroy]
    collection do
      get 'search' # 検索条件入力ページ
      get 'result' # 検索結果表示ページ
    end
  end

  resources :friend_wanted_posts do
    collection do
      get 'search' # 検索条件入力ページ
      get 'result' # 検索結果表示ページ
    end
  end

  devise_for :users
  resources :users, only:[:show, :edit,:update]

  get "up" => "rails/health#show", as: :rails_health_check

  authenticated :user do
    root 'timelines#index', as: :authenticated_root
  end

  root 'welcome#index'

  
end
