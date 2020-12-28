# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    # userの情報を設定＆生成
    @user = User.new(sign_up_params)

    # バリデーション確認
    unless @user.valid?
      # エラーの場合再表示を行い、処理を終了
      render :new and return
    else
      # ユーザー情報を登録する
      @user.save

      # 診断結果の保持確認
      unless session['scores_data'].blank?
        # 評価のセッション情報を取得
        session_scores = session['scores_data']

        # 評価コレクションの数をセッション情報と同じ数に設定
        Form::ScoreCollection.set_count(session['scores_data'].length)
        # 評価コレクションを生成
        @scores = Form::ScoreCollection.new
        # 繰り返しカウント
        num = 0

        # 評価コレクションの再設定
        @scores.scores.each do |score|
          # 回数を設定
          score[:count] = session_scores[num]["count"]
          # 区分IDを設定
          score[:division_id] = session_scores[num]["division_id"]
          # 問題IDを設定
          score[:problem_id] = session_scores[num]["problem_id"]
          # ユーザーID設定
          score[:user_id] = @user.id
          # インクリメント
          num += 1
        end

        # 評価&回答を保存
        @scores.save
        # セッションの情報を削除
        session['scores_data'].clear
      end

      # ログインする
      sign_in(:user, @user)
      # トップページに遷移する
      redirect_to root_path
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
