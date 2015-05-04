class PageController < ApplicationController
  def home
  end

  def landing


  end

  def user_landing
    if params[:id]=='ad'&&params[:pass]=='ad'
      render 'manager'
    else
      @user = User.authenticate(params[:id], params[:pass])
      if @user
        session[:user_id] = @user.id
        flash[:notice]="登录成功"
        render 'student'
      else
        flash[:notice]="帐号与密码不匹配"
        render 'landing'
      end
    end

  end

  def register
    @users=User.new

  end

  def register_user
    @users = User.new
    @users.name = params[:name]
    @users.user_id = params[:user_id]
    @users.password = params[:pass]
    @users.email=params[:email]
    if @users.save
      render "landing"
    else
      render 'register'
    end
  end


  def manager

  end

  def save
    @score=Score.new
    @score.name=params[:name]
    @score.ability_to_communicate = params[:fee]
    @score.professional_quality = params[:A]
    @score.ability_to_learn = params[:B]
    @score.speech_ability = params[:C]
    @score.comprehensive_ability = params[:D]
    @score.save
    render 'manager'
  end

  def student

  end

  def student_finding
    @scores = Score.find_by_name(params[:name])
    render 'student'
  end

  def manager_search
    @scores = Score.find_by_name(params[:name])
    render 'search'
  end


end
