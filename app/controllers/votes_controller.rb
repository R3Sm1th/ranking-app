class VotesController < ApplicationController
  def new
    @round = Round.find(params[:round_id])
    @vote = Vote.new
  end
  def create
    @round = Round.find(params[:round_id])
    @vote = @round.vote.build(vote_params)
    @vote.user = current_user

    respond_to do |format|
      if @vote.save
        format.html { redirect_to round_submissions_url(@round), notice: "Submission was successfully created." }
        format.json { render :show, status: :created, location: @submission }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # METHOD FOR TABULATING

  private

  def set_submission
    @vote = Vote.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def submission_params
    params.require(:vote).permit(:list)
  end
end
