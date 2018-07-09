class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_transactions, only: :show

  def index
  end

  def show

  end

  def buy
    byebug
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      redirect_to @user
    else
      flash[:errors] = @user.errrors.full_messages
      redirect_to new_user_path
    end
  end

  def edit
    byebug
  end

  def update
    @user.update(user_params)
    if @user.valid?
      redirect_to @user
    else
      flash[:errors] = @user.errrors.full_messages
      redirect_to edit_user_path
    end
  end

  def destroy
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, business_ids: [])
  end

  def set_businesses
    @businesses = Business.all
  end

  def set_transactions
    @user = User.find(params[:id])
    @transactions = @user.transactions.sort_by { |t| t.updated_at }
  end

  def set_user
    @user = User.find(params[:id])
  end

end
