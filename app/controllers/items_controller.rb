class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params[:item].permit(:name, :quantity))
    if @item.save
      flash[:notice] = 'Item created successfully'
      redirect_to items_path
    else
      flash.now[:alert] = 'Item create failed'
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(params.require(:item).permit(:name, :quantity))
      flash[:notice] = 'Item updated successfully'
      redirect_to items_path
    else
      flash.now[:alert] = 'Item update failed'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] = 'Item destroyed successfully'
    redirect_to items_path
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] = 'Item destroyed successfully'
    redirect_to items_path
  end
end
