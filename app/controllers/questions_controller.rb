class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = question
    @answers = Answer.where(question: @question).order(created_at: :desc)
    @answer = Answer.new(question: @question)
  end

  def edit
    @question = question
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    #THIS SHOULDN'T BE HARD CODED -- CHANGE ONCE WE GET TO THAT POINT
    @question.user = User.first

    if @question.save
      flash[:notice] = 'question added'
      redirect_to @question
    else
      @question.errors.full_messages.each do |error|
        flash[:notice] = error
      end
      redirect_to @question
    end
  end

  def update
    if question.update(question_params)
      flash[:notice] = 'question edited'
      redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy
    question.destroy
    redirect_to questions_path
  end

  private

  def question
    Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :description)
  end
end
