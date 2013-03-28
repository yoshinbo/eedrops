class SessionsController < ApplicationController

  def callback
    #raise request.env["omniauth.auth"].to_yaml

    #omniauth.auth���ϐ����擾
    auth = request.env["omniauth.auth"]

    #User���f��������
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) 

    if user
      # �����̃��[�U��񂪂������ꍇ�@���[�g�ɑJ�ڂ����܂�
      session[:user_id] = user.id
      redirect_to root_url, :notice => "login"
    else
      # User���f����:provider��:provider_id�������ꍇ�i�O���F�؂��Ă��Ȃ��j�A�ۑ����Ă��烋�[�g�֑J�ڂ�����
      User.create_with_omniauth(auth)
      redirect_to root_url, :notice => "#{auth["info"]["name"]}'s #{auth["provider"]} is now connected"
    end 
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Log out"
  end

end
