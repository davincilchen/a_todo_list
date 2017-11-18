class TodosController < ApplicationController


  before_action :set_todo, :only => [:show, :edit, :update, :destroy, :item_done]

  def index
    @todos = Todo.all
  end  


  def new
    @todo = Todo.new
    @allow_modify = true
  end


  def create
    @todo = Todo.new(todo_params)
    @todo.done = false
    if @todo.save
      redirect_to todos_url  
    else
      @allow_modify = true
      render :new
    end

  end

  # ================== #
  def show
    @allow_modify = false
  end

  def edit
    @allow_modify = true
  end
  # ================== #

  def item_done
    @todo.update(done: !(@todo.done))
    
  end

  def update
    if @todo.update_attributes(todo_params)
      redirect_to todos_url
    else
      @allow_modify = true
      render :action => :edit
    end
  end

  def destroy
    @todo.destroy
    redirect_to todos_url
  end


  # ================================== # 
  private
  def todo_params
    params.require(:todo).permit(:title, :notes, :due_date, :done)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
end
