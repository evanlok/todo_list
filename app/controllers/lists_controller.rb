class ListsController< ApplicationController
  before_filter :load_list, :only => [:show, :edit, :update, :destroy]

  def index
    @lists = List.includes(:tasks).all
  end

  def new
    @list = List.new
    @list.tasks.build
  end

  def create
    @list = List.new(params[:list])

    if @list.save
      redirect_to @list, :notice => "List created"
    else
      render :new
    end
  end

  def destroy
    @list.destroy

    redirect_to lists_url, :notice => "List destroyed"
  end


  private

  def load_list
    @list = List.find(params[:id])
  end
end
