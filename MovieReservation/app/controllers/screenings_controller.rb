class ScreeningsController < ApplicationController
  before_action :require_user, only: [:index, :show, :new, :edit, :create, :update, :destroy, :show_movies_screenings]
  before_action :set_screening, only: [:show, :edit, :update, :destroy]
  before_action :set_movie, only: [:show_movies_screenings, :new]

  # GET /screenings.json
  def index
    @screenings = Screening.all
  end

  # GET /screenings/1
  # GET /screenings/1.json
  def show
  end

  # GET /screenings/new
  def new
    @screening = Screening.new(movie: @movie)
  end

  # GET /screenings/1/edit
  def edit
  end

  # POST /screenings
  # POST /screenings.json
  def create
    @movie = Movie.find(screening_params[:movie_id])
    @room = Room.find(screening_params[:room])
    @screening = Screening.new(room: @room, movie: @movie)
    respond_to do |format|
      if @screening.save
        format.html { redirect_to root_url, notice: 'Screening was successfully created.' }
        format.json { render :show, status: :created, location: @screening }
      else
        format.html { render :new }
        format.json { render json: @screening.errors, status: :unprocessable_entity }
      end
      end
  end

  # PATCH/PUT /screenings/1
  # PATCH/PUT /screenings/1.json
  def update
    respond_to do |format|
      if @screening.update(screening_params)
        format.html { redirect_to @screening, notice: 'Screening was successfully updated.' }
        format.json { render :show, status: :ok, location: @screening }
      else
        format.html { render :edit }
        format.json { render json: @screening.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /screenings/1
  # DELETE /screenings/1.json
  def destroy
    @screening.destroy
    respond_to do |format|
      format.html { redirect_to screenings_url, notice: 'Screening was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show_movies_screenings
    @screenings = @movie.screenings
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_screening
      @screening = Screening.find(params[:id])
    end

    def set_movie
      @movie = Movie.find(params[:movie_id])
    end

  # Never trust parameters from the scary internet, only allow the white list through.
    def screening_params
      params.require(:screening).permit(:room, :movie_id)
    end
end
