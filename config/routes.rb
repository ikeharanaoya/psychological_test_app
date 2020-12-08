Rails.application.routes.draw do
  devise_for :users
  # ルートパスの設定
  root to: "problems#index"
  # problemsのパス
  resources :problems, only: [:show,:create] do
    # usersのパス
    resources :users, only: :index
  end
end
