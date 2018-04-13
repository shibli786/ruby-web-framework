require_relative './base_controller.rb'
require 'ostruct'


class DogsController < BaseController


  def index
    @title = "So many dogs"
    @dogs = (1..15).map do |i|
      OpenStruct.new(id: i, name: "Dog-#{i}")
    end
    build_response render_template
  end

  # GET /dogs/:id?name=Optional%20Custom%20Name
  #
  def show
    dog_name = params["name"] || "Dog-#{params[:id]}"
    @title = "#{dog_name}'s page"
    @dog = OpenStruct.new(id: params[:id], name: dog_name)
    build_response render_template
  end

  # GET /dogs/new
  #
  def new
    @title = "More dogs please"
    build_response render_template
  end

  # POST /dogs
  #
  def create
    redirect_to "dogs/"
  end

  # # GET /dogs
  # #
  # def index
  #   build_response dog_page("this should be a list of dogs")
  # end

  # # GET /dogs/:id
  # #
  # def show
  #   build_response dog_page("this should show dog ##{params[:id]}")
  # end

  # # GET /dogs/new
  # #
  # def new
  #   build_response dog_page("a page to create a new dog")
  # end

  # # POST /dogs
  # # not implemented for now
  # #
  # def create
  #   redirect_to "/dogs"
  # end

  # private
  # def dog_page(message)
  #   <<~HTML
  #     <html>
  #       <head><title>A Rack Demo</title></head>
  #       <body>
  #         <h1>This is DogsController##{params[:action]}</h1>
  #         <p>#{message}</p>
  #       </body>
  #     </html>
  #   HTML
  # end
end