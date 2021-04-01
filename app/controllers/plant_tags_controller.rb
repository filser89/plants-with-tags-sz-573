class PlantTagsController < ApplicationController
  before_action :set_plant

  def new
    @plant_tag = PlantTag.new
  end

  def create
    @plant_tag = PlantTag.new(plant_tag_params)
    @plant_tag.plant = @plant
    if @plant_tag.save
      redirect_to garden_path(@plant.garden) #no plant_path as we don't have show page for plant
    else
      render :new
    end

  end

  private

  def set_plant
    @plant = Plant.find(params[:plant_id])
  end

  def plant_tag_params
    params.require(:plant_tag).permit(:tag_id) #tag_id is a foreign key from the db table plant_tags
  end
end
