class User < ActiveRecord::Base
  def self.authenticate(id, password)
    user = User.find_by_user_id(id)
    if user && password == user.password
      return user
    end
    false
  end


end
