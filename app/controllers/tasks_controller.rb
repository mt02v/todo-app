class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path #セーブができたらindex1ページに行く
    else
      render 'new' #できなかったらnewページのまま
    end
  end


  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path #updateできたらindexページに行く
    else
      render 'edit' #できなかったらeditページのまま
    end
  end

  def edit
    @task = Task.find(params[:id]) #find(params[:id])は投稿され情報に付けられたidを探し出すコード
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path #updateできたらindexページに行く
    else
      render 'edit'
    end
  end

  def show
    @task = Task.find(params[:id]) #find(params[:id])で削除する情報を見つけて、destroyで削除
    @task.destroy
    redirect_to tasks_path
  end


private
 def task_params
  #モデル作成時に作ったやつ
  params.require(:task).permit(:title, :body)
 end
end