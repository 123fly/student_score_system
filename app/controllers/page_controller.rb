class PageController < ApplicationController
 def home
 end
  def landing


  end
 def user_register

  render'register'
  end

 def user_landing
  @user = User.authenticate(params[:id], params[:pass])
  if @user
   session[:user_id] = @user.id
   flash[:notice] = "Weclome #{@user.id}"
   render'manager'
  else
   flash[:notice] = "The id or password is not correct."
   render 'landing'
  end
 end
def student_landing
 
 end
 def register

  end

 def register_user
 @users = User.new
 @users.name = params[:name]
 @users.user_id = params[:id]
 @users.password = params[:pass]
 @users.email = params[:email]
  if @users.save
  render"landing"
   end
end
def manager
  end
  def student
  end

end
