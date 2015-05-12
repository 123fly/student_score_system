class User < ActiveRecord::Base
  def self.authenticate(id, password)
    user = User.find_by_user_id(id)
    if user && password == user.password
      return user
    end
    false
  end

  validates :user_id, :name, :password, :email, presence: true
  validates :user_id, :email, uniqueness: {case_sensitive: false}
  validates_format_of  :email, :message => "邮箱格式不正确!", :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_length_of :password, :in => 6..12
end
class Score < ActiveRecord::Base
  validates :number, uniqueness:{scope: :name}
end
