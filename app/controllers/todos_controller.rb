class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_goal
  before_action :set_todo, only: [:show, :edit, :update, :destroy, :sort]




  # GET /todos/new
  def new
     @todo = @goal.todos.new
  end

  # GET /todos/1/edit
  def edit
  end
  
  def sort
  end

  # POST /todos
  def create
     @todo = @goal.todos.new(todo_params)

    if @todo.save
        @status = true
    else
      @status = false
    end
  end

  # PATCH/PUT /todos/1
  def update
    if @todo.update(todo_params)
      redirect_to @todo, notice: 'Todo was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /todos/1
  def destroy
    @todo.destroy
    redirect_to todos_url, notice: 'Todo was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    
    def todo_params
      params.require(:todo).permit(:content, :goal_id, :position, :done)
    end
end
