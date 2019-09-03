class QuestionsController < ApplicationController
  def index
    #  GET  /tests/:test_id/questions(.:format)
    @questions = Test.find(params[:test_id]).questions
    respond_to do |format|
      format.html
      format.xml  { render xml: @questions }
      format.json { render json: @questions }
    end
  end

  def show
    # GET /tests/:test_id/questions/:id
    question = Test.find(params[:test_id]).questions.where('questions.id = ?', params[:id])
    render xml: question
  end

  def new
    # GET    /tests/:test_id/questions/new(.:format)
    # render plain: 'give me form for create new test '
  end

  def create
    # POST  /tests/:test_id/questions
    render plain: 'post form from user to server'
  end

  def destroy
    # DELETE /questions/:id(.:format)
    render plain: 'delete question'
  end
end
