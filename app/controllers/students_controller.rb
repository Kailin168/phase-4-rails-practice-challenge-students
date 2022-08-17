class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :update, :destroy]

def index
  render json: Student.all, status: 202
end

def show
  if @student
    render json: @student
  else 
    render json: { error: "No student" }, status: 404
  end
end

def create
  render json: Student.create!(student_params), status: 202
end


def update
  if @student
    render json: @student.update!(student_params)
  else 
    render json: { error: "No student" }, status: 404
  end
end

def destroy
  if @student
    @student.destroy
  else 
    render json: { error: "No student" }, status: 404
  end
end

private

def find_student
  @student = Student.find_by(id: params[:id])
end

def student_params
  params.permit(:name, :major, :age, :instructor_id)
end


end
