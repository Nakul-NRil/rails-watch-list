class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(new_list)

    if @list.save
      redirect_to @list, notice: "List is successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def new_list
    params.require(:list).permit(:name)
  end

end
