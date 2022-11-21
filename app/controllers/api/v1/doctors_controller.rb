class Api::V1::DoctorsController < ApplicationController
  before_action :set_doctor, only: %i[show update destroy]
  before_action :authorize_request, only: %i[create update destroy]

  def index
    @doctors = Doctor.all
    render json: @doctors
  end

  def show
    render json: @doctor, status: :ok
  end

  def update
    if current_user.role == 'admin' && @doctor.update(doctor_params)
      render json: { data: 'Doctor Updated Successfully', status: :ok }
    else
      render json: { data: 'Something went wrong', status: 'failed' }
    end
  end

  def destroy
    if current_user.role == 'admin' && @doctor.destroy
      render json: { data: 'Doctor Deleted Successfully', status: :ok }
    else
      render json: { data: 'Something went wrong', status: 'failed' }
    end
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if current_user.role == 'admin' && @doctor.save
      render json: { data: 'Doctor Created Successfully', status: :ok }
    else
      render json: { data: @doctor.errors.full_messages, status: 'failed' }, status: :unprocessable_entity
    end
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:name, :bio, :specialization, :avaliability, :photo, :gender)
  end
end
