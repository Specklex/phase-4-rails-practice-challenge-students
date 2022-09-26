class InstructorsController < ApplicationController
  def index
    render json: Instructor.all, status: :ok
  end

  def show
    render json: Instructor.find_by(id: params[:id]), status: :ok
  end

  def create
    instructor = Instructor.create(instructor_params)
    render json: instructor, status: :created
  end

  def update
    instructor = Instructor.find_by(id: params[:id]).update(instructor_params)
    render json: instructor, status: :ok
  end

  def destroy
    Instructor.find_by(id: params[:id]).destroy
    head :no_content
  end

  def instructor_params
    params.permit(:name)
  end

  def find_instructor
    instructor = Instructor.find_by(id: params[:id])
    render json: instructor
  end
end
