class ApplicationController < ActionController::Base
class   Users<ActiveRecord::Base
                  has_one :Score
end
class  Sscore<ActiveRecord::Base
                 has_one :User

end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
