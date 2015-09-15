class AnswersController < ApplicationController

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.question = question

    #THIS SHOULDN'T BE HARD CODED -- CHANGE ONCE WE GET TO THAT POINT
    @answer.user = User.first

    if @answer.save
      flash[:notice] = "Answer submitted!"
      redirect_to question_path(question)
    else
      @answer.errors.full_messages.each do |error|
        if flash[:notice]
          flash[:notice] << ", #{error}"
        else
          flash[:notice] = error
        end
      end
      redirect_to question_path(question)
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

  def question
    Question.find(params[:question_id])
  end

end
