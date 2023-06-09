class ListsController < ApplicationController
  before_action :set_list, only: [:show]
  def index
    @lists = List.all
    if params[:query].present?
      @query = params[:query]
      @lists = List.where("name LIKE ?", "%#{params[:query]}%")

    else
      @lists= List.all
    end
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
    redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to list_path, status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
