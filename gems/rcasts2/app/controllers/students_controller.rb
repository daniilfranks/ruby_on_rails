class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :activate, :edit, :update]

  def index
    @students = Student.all
  end

  def show
  end

  def activate
    @student.active = !@student.active
    @student.save
    redirect_to student_path(@student)
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student, notice: 'Student was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @student.update(student_params)
      redirect_to @student, notice: 'Student was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:f_name, :l_name, :active)
  end
end
