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
    @users = User.new(user_params)

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
    @score.ability_to_communicate = params[:abilit_to_communicate]
    @score.professional_quality = params[:professional_quality]
    @score.ability_to_learn = params[:ability_to_learn]
    @score.speech_ability = params[:speech_ability]
    @score.comprehensive_ability = params[:comprehensive_ability]
    @score.save
    render 'manager'
  end

  def student

  end

  def student_finding
    @scores = Score.where('name = ?',params[:name])
    render 'student'
  end

  def manager_search
    @scores = Score.where("name = ?", params[:name])

      render 'search'
  end

  def history
    @scores = Score.all
    render 'search'
  end

  private
  def user_params
    params.require(:users).permit(:name, :user_id, :pass, :email)
  end

end
