class StudentsController < ApplicationController
  def index
    render json: Student.all, status: :ok
  end

  def show
    render json: Student.find_by(id: params[:id]), status: :ok
  end

  def create
    student = Student.create(student_params)
    render json: :student, status: :created
  end

  def update
    student = Student.find_by(id: params[:id]).update(student_params)
    render json: student, status: :ok
  end

  def destroy
    Student.find_by(id: params[:id]).destroy
    head :no_content
  end

  def student_params
    params.permit(:name, :major, :age, :instructor_id)
  end

  def find_student
    student = Student.find_by(id: params[:id])
    render json: student
  end
end
