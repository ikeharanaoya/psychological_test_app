Rails.application.routes.draw do
  get 'users/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # ルートパスの設定
  root to: "problems#index"
  # problemsのパス
  resources :problems, only: [:show,:create] do
    # usersのパス
    resources :users, only: :show
    # 賢者情報取得のパス
    get 'kenja_search'
    # 最新情報取得のパス
    get 'new_search'
    # 自己ベスト情報取得のパス
    get 'best_search'
  end
end
