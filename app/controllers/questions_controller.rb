class QuestionsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_question, only: [:show, :destroy]

  def new
    @question = Question.new
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

  def destroy
    if current_user.author_of? @question
      @question.destroy
      redirect_to questions_path,
        notice: 'The question has been successfully deleted.'
    else
      redirect_to questions_path,
        notice: 'The question has not been deleted.'
    end
  end

  def index
    @questions = Question.all
  end

  def show
    @answer = Answer.new
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
