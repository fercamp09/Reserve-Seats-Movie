class SeatsController < ApplicationController
  before_action :require_user, only: [:index, :show, :edit, :create, :update, :destroy, :show_screening_seats, :reservar_asiento, :eliminar_reserva]
  before_action :set_seat, only: [:show, :edit, :update, :destroy, :reservar_asiento, :eliminar_reserva]
  before_action :set_screening, only: [:show_screening_seats, :reservar_asiento, :eliminar_reserva]

  # GET /seats
  # GET /seats.json
  def index
    @seats = Seat.all
  end

  # GET /seats/1
  # GET /seats/1.json
  def show
  end

  # GET /seats/new
  def new
    @seat = Seat.new
  end

  # GET /seats/1/edit
  def edit
  end

  # POST /seats
  # POST /seats.json
  def create
    @seat = Seat.new(seat_params)

    respond_to do |format|
      if @seat.save
        format.html { redirect_to @seat, notice: 'Seat was successfully created.' }
        format.json { render :show, status: :created, location: @seat }
      else
        format.html { render :new }
        format.json { render json: @seat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /seats/1
  # PATCH/PUT /seats/1.json
  def update
    respond_to do |format|
      if @seat.update(seat_params)
        format.html { redirect_to @seat, notice: 'Seat was successfully updated.' }
        format.json { render :show, status: :ok, location: @seat }
      else
        format.html { render :edit }
        format.json { render json: @seat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seats/1
  # DELETE /seats/1.json
  def destroy
    @seat.destroy
    respond_to do |format|
      format.html { redirect_to seats_url, notice: 'Seat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET screening/seats/1
  def show_screening_seats
    @seats = @screening.room.seats
  end

  # GET reservar/seats/:id
  def reservar_asiento
    respond_to do |format|
      if current_user.reservations.create([{seat: @seat, screening: @screening}])
        format.html { redirect_to screenings_seats_url(@screening), notice: 'Seat was successfully updated.' }
        format.json { render :show_screening_seats, status: :ok, location: @seat }
      else
        format.html { render :show_screening_seats }
        format.json { render json: @seat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE eliminar_reserva/seats
  def eliminar_reserva
    Reservation.find_by_screening_id_and_seat_id(@screening, @seat).destroy
    redirect_to screenings_seats_url(@screening), notice: 'Seat was successfully updated.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seat
      @seat = Seat.find(params[:id])
    end

    def set_screening
      @screening = Screening.find(params[:screening_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def seat_params
      params.require(:seat).permit(:row, :column)
    end
end
