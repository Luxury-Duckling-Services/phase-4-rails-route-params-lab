class StudentsController < ApplicationController

  def index
    puts params[:name]
    if params[:name]
      if Student.find_by(first_name: params[:name])
        students = Student.where("first_name = '#{params[:name]}'")
      elsif Student.find_by(last_name: params[:name])
        students = Student.where("last_name = '#{params[:name]}'")
      end
      render json: students
    else
      students = Student.all
      render json: students
    end
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end

end
