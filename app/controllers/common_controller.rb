class CommonController < ApplicationController
  # 循環しないようにログインフィルタをスキップする
  before_filter :has_logined, :except => [ :top ]

  def top
    @user = current_user;
    respond_to do |format|
      format.html
      format.json { render is_logined: @user ? 1 : 0 }
    end
  end
end
