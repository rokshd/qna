class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_answer, only: [:destroy, :update, :mark_best]
  before_action :set_question, only: [:destroy, :update, :mark_best]

  def create
    @question = Question.find(params[:question_id])

    @answer = @question.answers.build(answer_params)
    @answer.user = current_user

    if @answer.save
      flash[:notice] = 'The answer has been successfully created.'
    else
      flash[:alert] = 'The answer has not been created.'
    end
  end

  def update
    if current_user.author_of? @answer
      @answer.update(answer_params)
      flash[:notice] = 'The answer has been successfully updated.'
    else
      flash[:alert] = 'The answer has not been updated.'
    end
  end

  def destroy
    if current_user.author_of? @answer
      @answer.destroy
      flash[:notice] = 'The answer has been successfully deleted.'
    else
      flash[:alert] = 'The answer has not been deleted.'
    end
  end

  def mark_best
    if current_user.author_of?(@question)
      @question.reset_best_status
      @answer.update(best: true)
      flash[:notice] ='The answer has been marked as the best.'
    else
      flash[:alert] ='You can not mark this answer.'
    end
  end

  private

  def set_question
    @question = @answer.question
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:body, :best)
  end
end
