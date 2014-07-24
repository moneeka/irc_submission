class SubmissionsController < ApplicationController
  def new
    @submission = Submission.new
  end

  def create
    @submission = Submission.new(application_params)

    if @submission.save
      redirect_to @submission
    else
      render 'new'
    end
  end

  def show
    @submission = Submission.find(params[:id])
  end

  def index
    @submissions = Submission.all
  end

  def update
    @submission = Submission.find(params[:id])

    if @submission.update(application_params)
      redirect_to @submission
    else
      render 'edit'
    end
  end

  def edit
    @submission = Submission.find(params[:id])
  end

  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy

    redirect_to submissions_path
  end

  private
  def application_params
    params.require(:submission).permit(:title, :text)
  end
end
