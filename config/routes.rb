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
  end
end
