class Admin::AnswersController < Admin::BaseController
  before_action :find_answer, only: %i[show edit update destroy]
  before_action :find_question, only: %i[new create]

  def show; end

  def new
    @answer = @question.answers.build
  end

  def edit; end

  def create
    if @question.answers.build(answer_params).save
      redirect_to admin_question_path(@question)
    else
      render :new
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to admin_question_path(@answer.question.id)
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to admin_question_path(@answer.question.id)
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
