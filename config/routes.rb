Rails.application.routes.draw do
  # ルートパスの設定
  root to: "problems#index"
  # problemsのパス
  resources :problems, only: [:create]
end
