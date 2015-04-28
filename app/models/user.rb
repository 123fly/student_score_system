class User < ActiveRecord::Base
  def self.authenticate(id, password)
    user = User.find_by_user_id(id)
    if user && password == user.password
      return user
    end
    false
  end

  validates :user_id, :name, :password, :email, presence: true
  validates :user_id, :name, uniqueness: {case_sensitive: false}


end
