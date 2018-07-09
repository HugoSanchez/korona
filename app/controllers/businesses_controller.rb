class BusinessesController < ApplicationController

  before_action :set_business, only: [:show, :edit, :update, :destroy]
  before_action :set_items, only: :show

  def index
    @businesses = Business.all
  end

  def show
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.create(business_params)
    if @business.valid?
      redirect_to @business
    else
      flash[:errors] = @business.errors.full_messages
      redirect_to new_business_path
    end
  end

  def edit
  end

  def update
    @business.create(business_params)
    if @business.valid?
      redirect_to @business
    else
      flash[:errors] = @business.errors.full_messages
      redirect_to edit_business_path
    end
  end

  def destroy
    @business.destroy
  end

  private

  def set_business
    @business = Business.find(params[:id])
  end

  def business_params
    params.require(:business).permit(:name, :password, user_ids:[])
  end

  def set_users
    @users = User.all
  end

  def set_transactions
    @transactions = Transactions.all
  end

  def set_items
    @business = Business.find(params[:id])
    @items = @business.items
  end

end
