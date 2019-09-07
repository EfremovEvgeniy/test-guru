class AnswersController < ApplicationController
  before_action :find_answer, only: %i[show edit update destroy]
  before_action :find_question, only: %i[new create]

  def show
    # GET    /answers/:id(.:format)
  end

  def new
    # GET /questions/:question_id/answers/new(.:format)
    @answer = @question.answers.build
  end

  def edit
    # /answers/:id/edit
  end

  def create
    # POST   /questions/:question_id/answers
    if @question.answers.build(answer_params).save
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def update
    # PATCH /answers/:id
    if @answer.update(answer_params)
      redirect_to @answer
    else
      render :edit
    end
  end

  def destroy
    # DELETE /answers/:id
    @answer.destroy
    redirect_to @answer.question
  end

  private

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end
end
