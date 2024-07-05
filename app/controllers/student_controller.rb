class StudentController < ApplicationController

  # http_basic_authenticate_with name: "humbaba", password: "5baa61e4"

  # before_action :check_for_student


  def index

    cookies[:name] = Student.first.name
    # clients url = /student?status=activated

    # if params[:status] == "activated"
    #   @student = Student.last
    #   # redirect_to student_new_path
    # elsif params[:status] == "inactivated"
    #   @student = Student.first
    # else 
    #   @student = Student.first
    # end

    @students = Student.all
    # session[:name] = @student.name
    # session[:password] = @student.rollno

    # render json: @students


  end

  def new
    cookies.delete("name")
  end

  def show
    @student = Student.find(params[:id])

    # render json: @student

    # redirect_to action: :display

    # render layout: "display"

    # redirect_back(fallback_location: students_new_path)

  end

  def display
  end

  private
  def check_for_student
     puts "user has to loggin with the "
  end
end
