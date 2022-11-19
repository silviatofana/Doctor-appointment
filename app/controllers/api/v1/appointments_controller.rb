class Api::V1::AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[show update destroy]
  before_action :authorize_request, only: %i[index destroy create update]

  # GET /appointments
  def index
    @appointments = current_user.appointments

    render json: @appointments
  end

  # GET /appointments/1
  def show
    render json: @appointment
  end

  # POST /appointments
  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      render json: @appointment, status: :created, message: 'Appointment created successfully'
    else
      render json: @appointment.errors, status: :unprocessable_entity, message: 'Appointment not created'
    end
  end

  # PATCH/PUT /appointments/1
  def update
    if @appointment.update(appointment_params)
      render json: @appointment
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /appointments/1
  def destroy
    @appointment.destroy
    render json: { 'message' => 'Deleted successfully'}
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def appointment_params
    params.require(:appointment).permit(:date_of_appointment, :time_of_appointment, :user_id, :doctor_id,
                                        :description)
  end
end
