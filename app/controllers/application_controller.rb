class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

private
  def current_user
      @current_user ||= User.find_by_id(session[:user_id])
  end

  # 認証状況を確認するフィルタの定義
  def has_logined
    if session[:user_id]
      begin
        @user = User.find_all_by_id(session[:user_id])
        rescue ActiveRecord::RecordNotFound
          logger.error session[:user_id] + " doesn't exist in user data."
          reset_session
        end
      end

      unless @user
        # セッションに今いたページを記録しておく
        flash[:referer] = request.fullpath
        #redirect_to :controller => 'login', :action => 'index'
        redirect_to :controller => 'common', :action => 'top'
      end
    end
  end
