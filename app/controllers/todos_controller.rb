class TodosController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json

  def index 
    #respond_with Todo.all
    @todo = Todo.all

    respond_to do |format| 
      format.html
      format.json { render json: @todo }
    end
  end

  def show
    respond_with Todo.find(params[:id])
  end

  def create
    respond_with Todo.create(todo_params)
  end

  def update
    respond_with Todo.update(params[:id], todo_params)
  end

  def destroy
    respond_with Todo.destroy(params[:id])
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.require(:todo).permit(:title, :is_completed)
    end
end
