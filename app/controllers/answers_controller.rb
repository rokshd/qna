class AnswersController < ApplicationController
  before_action :authenticate_user!

  def create
    @question = Question.find(params[:question_id])

    @answer = @question.answers.new(answer_params)
    @answer.user = current_user

    if @answer.save
      redirect_to @question, notice: 'The answer has been successfully created.'
    else
      flash[:error] = 'The answer has not been created.'
      render "questions/show"
    end
  end

  def destroy
    @answer = Answer.find(params[:id])

    if current_user.author_of? @answer
      @answer.destroy
      redirect_to @answer.question,
        notice: 'The answer has been successfully deleted.'
    else
      redirect_to @answer.question,
        notice: 'The answer has not been deleted.'
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

end
