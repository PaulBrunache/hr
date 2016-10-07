class JobPostingsController < ApplicationController
  before_action :set_job_posting, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_human_resource!, only: [:new,:update,:create, :destroy]
  before_action :validate_role, except: [:index, :show]


  def index
    @job_postings = JobPosting.all
  end

  def show
  end

  def new
    @job_posting = JobPosting.new
  end

  def edit
  end

  def create
    @job_posting = JobPosting.new(job_posting_params)

    if @job_posting.save
      flash[:success] = "Job was successfully Created"
      redirect_to job_postings_path
    else
      render :new
    end
  end

  def update
    if @job_posting.update(job_posting_params)
      flash[:success] = "Job was successfully Updated"
      redirect_to job_postings_path
    else
      render :edit
    end
  end

  # DELETE /job_postings/1
  def destroy
    @job_posting.destroy
    flash[:success] = "Job was successfully Deleted"
    redirect_to job_postings_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_posting
      @job_posting = JobPosting.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def job_posting_params
      params.require(:job_posting).permit(:title, :description)
    end

    def validate_role
      if current_human_resource.role == 'Human Resources'
        true
      else
        flash[:error] = "you are not authorized to access this section"
        redirect_to hr_dashboard_manageReferrals_path
        false
      end
    end

end
