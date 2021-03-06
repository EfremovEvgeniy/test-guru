class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: :destroy

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    if Badge.create(badge_params)
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:title, :image_url, :rule, :param)
  end
end
