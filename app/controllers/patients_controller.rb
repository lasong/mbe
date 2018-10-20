class PatientsController < ApplicationController
  def index
    patients = Patient.eager(:user, :address, :pre_existing_conditions).all
    render json: { data: patients.map { |patient| PatientSerializer.new(patient).serialize }}
  end

  def show
    patient = Patient[identifier: params[:identifier]]
    render json: { data: PatientSerializer.new(patient).serialize }
  end
end