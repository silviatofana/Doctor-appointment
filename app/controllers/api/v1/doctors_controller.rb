class Api::V1::DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all.sample
    render json: @doctors
  end
end
