class QuestionsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_question, only: [:show, :destroy, :update]

  def new
    @question = Question.new
    @question.attachments.build
  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      flash[:notice] = 'Your question has been successfully created.'
      redirect_to @question
    else
      flash[:error] = 'The question has not been created.'
      render :new
    end
  end

  def index
    @questions = Question.all
  end

  def show
    @answer = @question.answers.build
    @answer.attachments.build
  end

  def update
    if current_user.author_of? @question
      @question.update(question_params)
      flash[:notice] = 'The question has been successfully updated.'
    else
      flash[:alert] = 'The question has not been updated.'
    end
  end

  def destroy
    if current_user.author_of? @question
      @question.destroy
      flash[:notice] = 'The question has been successfully deleted.'
    else
      flash[:alert] = 'The question has not been deleted.'
    end
    redirect_to questions_path
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :body,
      attachments_attributes: [:file, :id, :_destroy])
  end
end
