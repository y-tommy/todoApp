class TasksController < ApplicationController

  before_action :authenticate_user!

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = current_user.tasks
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = target_task params[:id]
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
    @task = target_task params[:id]
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = current_user.tasks.new task_params

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'ToDoを作成しました' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    @task = target_task params[:id]
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: '編集しました' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = target_task params[:id]
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'ToDoを削除しました' }
      format.json { head :no_content }
    end
  end

  private
    def target_task task_id
      current_user.tasks.where(id: task_id).take
    end


    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :description)
    end
end
