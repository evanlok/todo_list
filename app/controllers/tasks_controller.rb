class TasksController < ApplicationController
  before_filter :load_list
  before_filter :load_task, :except => [:create]

  def create
    @task = @list.tasks.build(params[:task])

    if @task.save
      flash[:notice] = "Task created"
    else
      flash[:error] = "Task not created"
    end

    redirect_to @list
  end

  def destroy
    @task.destroy

    redirect_to @list, :notice => "Task destroyed"
  end

  def complete
    @task.update_attribute(:completed, true)
    
    redirect_to @list
  end

  private

  def load_list
    @list = List.find(params[:list_id])
  end
  
  def load_task
    @task = @list.tasks.find(params[:id])
  end
end
