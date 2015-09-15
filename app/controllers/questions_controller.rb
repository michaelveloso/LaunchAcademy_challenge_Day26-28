class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order(created_at: :desc)
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
      flash[:notice] = 'Question added'
      redirect_to @question
    else
      @question.errors.full_messages.each do |error|
        if flash[:notice]
          flash[:notice] << ", #{error}"
        else
          flash[:notice] = error
        end
      end
      render :new
    end
  end

  def update
    @question = question
    if @question.update(question_params)
      flash[:notice] = 'question edited'
      redirect_to @question
    else
      @question.errors.full_messages.each do |error|
        if flash[:notice]
          flash[:notice] << ", #{error}"
        else
          flash[:notice] = error
        end
      end
      render :edit
    end
  end

  def destroy
    question.destroy
    flash[:notice] = 'question deleted'
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
