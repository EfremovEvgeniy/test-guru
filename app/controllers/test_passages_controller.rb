class TestPassagesController < ApplicationController
  before_action :find_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      give_badges(@test_passage) if @test_passage.success?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    service = GistQuestionService.new(@test_passage.current_question)
    service.call

    if service.success?
      @gist = Gist.new(question_id: @test_passage.current_question.id, user_id: @test_passage.user.id,
                       url: service.response[:html_url])
      @gist.save
      flash[:notice] = t('.success', url: (helpers.link_to 'Gist', @gist.url, target: '_blank'))
    else
      flash[:alert] = t('.failure')
    end
    redirect_to @test_passage
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def give_badges(test_passage)
    badges_for_user = AssignBadgeService.new(test_passage).call
    badges_for_user.each do |badge|
      current_user.badges.push(badge)
    end
  end
end
