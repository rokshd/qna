class AnswersController < ApplicationController
  before_action :authenticate_user!

  def create
    @question = Question.find(params[:question_id])

    @answer = @question.answers.create(answer_params)
    @answer.user = current_user

    if @answer.save
      flash[:notice] = 'The answer has been successfully created.'
    else
      flash[:alert] = 'The answer has not been created.'
      # render "questions/show"
    end
  end

  def destroy
    @answer = Answer.find(params[:id])

    if current_user.author_of? @answer
      @answer.destroy
      flash[:notice] = 'The answer has been successfully deleted.'
    else
      flash[:alert] = 'The answer has not been deleted.'
    end
    redirect_to @answer.question
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

end
