class Api::UsersController < ApplicationController
	before_action :authorized, only: [:auto_login]

  # REGISTER
  def index
    
    @users = User.all
    @users = @users.starts_with('username', params[:username]) if params[:username]

    paginate @users, per_page: (params[:per_page]) ? params[:per_page] : 15
  end
  
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token, role: User.roles[@user.role]}
    else
      render json: {error: "Invalid username or password"}
    end
  end


  def auto_login
    render json: @user
  end

  private

  def user_params
    params.permit(:username, :password, :role, :age)
  end
end
