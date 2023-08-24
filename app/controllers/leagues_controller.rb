class LeaguesController < ApplicationController
  before_action :set_league, only: %i[ show edit update destroy join leave ]

  # GET /leagues or /leagues.json
  def index
    @leagues = League.all
  end

  # GET /leagues/1 or /leagues/1.json
  def show
    @post = Post.new
    @round = Round.new
    @next_round = @league.rounds.where(completed: false).sort()
  end

  # GET /leagues/new
  def new
    @league = League.new
  end

  # GET /leagues/1/edit
  def edit
  end

  # POST /leagues or /leagues.json
  def create
    @league = League.new(league_params)
    @league.users << current_user
    respond_to do |format|
      if @league.save
        format.html { redirect_to league_url(@league), notice: "League was successfully created." }
        format.json { render :show, status: :created, location: @league }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @league.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leagues/1 or /leagues/1.json
  def update
    respond_to do |format|
      if @league.update(league_params)
        format.html { redirect_to league_url(@league), notice: "League was successfully updated." }
        format.json { render :show, status: :ok, location: @league }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @league.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leagues/1 or /leagues/1.json
  def destroy
    @league.destroy

    respond_to do |format|
      format.html { redirect_to leagues_url, notice: "League was successfully destroyed." }
      format.json { render :index, status: :ok }
    end
  end
  # Joining and Leaving
  def join
    if (@league.users.count + 1) > @league.max_players
      redirect_to league_url(@league), notice: 'Max Players Reached'
    end
    @league.users << current_user
    redirect_to league_url(@league), notice: 'You have successfully joined'
  end

  def leave
    @league.users.delete(current_user)
    redirect_to league_url(@league), notice: 'You have successfully left this league'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_league
      @league = League.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def league_params
      params.fetch(:league, {}).permit(:name, :description, :max_players, :no_rounds)
    end
end
