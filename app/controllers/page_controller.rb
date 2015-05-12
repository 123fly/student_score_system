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
        @scores = Score.where('name = ?', User.find_by_user_id(params[:id]).name)
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

  def user_params
    params.permit(:name, :user_id, :password, :email)
  end

  def manager

  end

  def save
    @score = Score.new(score_params)
    @score.save
    render 'manager'
  end

  def score_params
    params.permit(:name, :ability_to_communicate, :professional_quality, :ability_to_learn, :speech_ability, :comprehensive_ability, :number)
  end

  def student

  end

  def student_finding
    @scores = Score.where('name = ?', params[:name])
    render 'student'
  end

  def manager_search

  end

  def search
    if params[:name] != nil
      session[:name] = params[:name]
    end
    @scores = Score.where('name = ?', session[:name]).paginate :page => params[:page], :per_page => 10
    render 'search'
  end

  def history
    @scores = Score.paginate :page => params[:page], :per_page => 10
    render 'search'
  end

  def edit

  end

  def update
    @scores = Score.find_by_id(params[:id])
    if @scores.update(scores_params)
      render 'manager'
    else
      render 'edit'
    end
  end

  def ajax_number
    @score = Score.where('name = ?', params[:name]).last
    if @score != nil
      respond_to do |format|
        format.json { render :xml => '已经评到第'+@score.number+'周' }
      end
    else
      respond_to do |format|
        format.json { render :xml => '已经评到第0周'}
      end
    end
  end

  private
  def scores_params
    params.permit(:ability_to_communicate, :professional_quality, :ability_to_learn, :speech_ability, :comprehensive_ability)
  end


end
