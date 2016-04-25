class ListsController < ApplicationController


  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "List successfully added!"
      redirect_to list_path(@list)
    else
      flash[:error] = "List did NOT save correctly!"
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      flash[:notice] = "List updated successfully!"
      redirect_to lists_path
    else
      flash[:error] = "List did NOT update correctly!"
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    if @list.destroy
      flash[:notice] = "List deleted successfully!"
      redirect_to lists_path
    else
      flash[:error] = "List did NOT delete correctly!"
      redirect_to lists_path
    end
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end
end
