class User < ActiveRecord::Base
  attr_accessible :email, :name, :provider, :uid, :total_g_min, :total_l_min, :total_r_min, :total_s_min

  def self.create_with_omniauth(auth)
    create!do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      if user.provider == "facebook"
        user.name = auth["info"]["name"]
      else
        user.name = auth["info"]["nickname"]
      end
    end
  end
end
