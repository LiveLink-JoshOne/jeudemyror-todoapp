class TodosController < ApplicationController

  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  def new
    @todo = Todo.new  ## Will use this instance var in the view
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = 'Your To-Do item was successfully created!'
      redirect_to todo_path(@todo)  ## todo_path is redirect to todo#show generated by auto-routes
    else
      render 'new'                  ## Show same form if DB refuses entry (i.e. fails validation)
    end
  end

  def show                          ## For the redirect above to work
  end

  def edit   ## You may notice this is identical to the #show method
  end

  def update  ## You may notice this is ALMOST identical to #create method
    if @todo.update(todo_params)    ## Unlike #create, we are updating the record as opposed to saving it
      flash[:notice] = 'Your To-Do item was successfully updated!'
      redirect_to todo_path(@todo)
    else
      render 'edit'                 ## Unlike #create, we want to show the 'edit' page again w/ details of what went wrong
    end
  end

  def index
    @todos = Todo.all   ## Simply grab all of the Todo items and assign to var
  end

  def destroy
    @todo.destroy  ## Remove entry from DB as prev learned
    flash[:notice] = 'Successfully delete To-Do item'  ## Notify user
    redirect_to todos_path  ## Go back to the list
  end

  private  ## Only available to THIS controller

    def set_todo
      @todo = Todo.find(params[:id])
    end

    def todo_params
      params.require(:todo).permit(:name, :description)  ## Whitelisting these fields so we can use them!
    end

end
