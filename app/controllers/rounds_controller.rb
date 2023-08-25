class RoundsController < ApplicationController
  before_action :set_round, only: %i[ show edit update destroy ]

  # GET /rounds or /rounds.json
  def index
    @rounds = Round.all
  end

  # GET /rounds/1 or /rounds/1.json
  def show
    # @league = League.find(params[:league_id])
    @submissions = @round.submissions
  end

  # GET /rounds/new
  def new
    @round = Round.new
  end

  # GET /rounds/1/edit
  def edit
  end

  # POST /rounds or /rounds.json
  def create
    @league = League.find(params[:league_id])
    @round = @league.rounds.build(round_params)
    @round.completed = false

    respond_to do |format|
      if @round.save
        format.html { redirect_to league_url(@league), notice: "Round was successfully created." }
        format.json { render :show, status: :created, location: @round }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rounds/1 or /rounds/1.json
  def update
    respond_to do |format|
      if @round.update(round_params)
        format.html { redirect_to round_url(@round), notice: "Round was successfully updated." }
        format.json { render :show, status: :ok, location: @round }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rounds/1 or /rounds/1.json
  # def destroy
  #   @round.destroy

  #   respond_to do |format|
  #     format.html { redirect_to rounds_url, notice: "Round was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  # Testing voting routing
  def vote
    @votes = params[:votes]
    points = 10
    finalsubmissions = []

    @votes.each do |vote|
      @submission = Submission.find_by(movieid: vote)
      finalsubmissions << @submission
      @submission.points += points
      points -= 1
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_round
      @round = Round.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def round_params
      params.require(:round).permit(:theme, :description, :submission_deadline, :voting_deadline)
    end
end
