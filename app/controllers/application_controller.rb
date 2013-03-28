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
          #logger.error "セッションの情報(" + session[:user_id] + ")は user には存在しません。"
          reset_session
        end
      end

      unless @user
        #flash[:referer] = request.fullpath
        #redirect_to :controller => 'login', :action => 'index'
        redirect_to :controller => 'logs', :action => 'index'
      end
    end
end
