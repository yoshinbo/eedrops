class SessionsController < ApplicationController

  def callback
    #raise request.env["omniauth.auth"].to_yaml

    #omniauth.auth環境変数を取得
    auth = request.env["omniauth.auth"]

    #Userモデルを検索
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) 

    if user
      # 既存のユーザ情報があった場合　ルートに遷移させます
      session[:user_id] = user.id
      redirect_to root_url, :notice => "login"
    else
      # Userモデルに:providerと:provider_idが無い場合（外部認証していない）、保存してからルートへ遷移させる
      User.create_with_omniauth(auth)
      redirect_to root_url, :notice => "#{auth["info"]["name"]}'s #{auth["provider"]} is now connected"
    end 
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Log out"
  end

end
