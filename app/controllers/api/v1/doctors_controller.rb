class Api::V1::DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all.sample
    render json: @doctors
  end

  def update
    doctor = Doctor.find(params[:id])
    doctor.update_attributes(doctor_params)
    render json: doctor
  end

  def destroy
    Doctor.destroy(params[:id])
  end
  
  

  def create
    dog = Doctor.create(doctor_params)
    render json: dog
  end

  private 

def doctor_params
  params.require(:doctor).permit(:name, :bio, :specialization, :avaliability, :photo)
end
end