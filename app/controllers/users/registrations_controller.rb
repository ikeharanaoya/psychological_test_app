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
    if @user.valid?
      # ユーザー情報を登録する
      @user.save

      # 診断結果の保持確認
      unless session['scores_data'].blank?
        # 評価のセッション情報を取得
        session_scores = session['scores_data']
        # 評価コレクションの数をセッション情報と同じ数に設定
        Form::ScoreCollection.set_count(session_scores.length)
        # 評価コレクションを生成
        @scores = Form::ScoreCollection.new
        # 繰り返しカウント
        num = 0

        # 評価コレクションの再設定
        @scores.scores.each do |score|
          # 回数を設定
          score[:count] = session_scores[num]['count']
          # 合計点数
          score[:sum] = session_scores[num]['sum']
          # 区分IDを設定
          score[:division_id] = session_scores[num]['division_id']
          # 問題IDを設定
          score[:problem_id] = session_scores[num]['problem_id']
          # ユーザーID設定
          score[:user_id] = @user.id
          # インクリメント
          num += 1
        end

        # 評価のセッション情報を取得
        session_answers = session['answers_data']
        # 回答コレクションの数を質問と同じ数に設定
        Form::AnswerCollection.set_count(session_answers.length)
        # 回答コレクションを生成
        @answers = Form::AnswerCollection.new

        # 繰り返しカウント
        num = 0
        # 回答コレクションの再設定
        @answers.answers.each do |answer|
          # 回答を設定
          answer[:answer] = session_answers[num]['answer']
          # 質問IDを設定
          answer[:question_id] = session_answers[num]['question_id']

          # 回答→質問から区分を取得
          division_id = answer.question.division_id
          # 区分に紐づく評価を取得
          score = @scores.scores.find { |a| a[:division_id] == division_id }
          # 評価と回答を紐づける
          score.answers.build(answer.attributes)

          # インクリメント
          num += 1
        end

        # 評価&回答を保存
        @scores.save
        # セッションの情報を削除
        session['scores_data'].clear
        session['answers_data'].clear
      end

      # ログインする
      sign_in(:user, @user)
      # トップページに遷移する
      redirect_to root_path
    else
      # エラーの場合再表示を行い、処理を終了
      render :new and return
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
