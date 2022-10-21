class MonstersController < ApplicationController
  def index
    @monsters = Monster.all.order(name: :desc)
  end

  def show
    @monster = Monster.find(params[:id])
  end


  def create
    @monster = Monster.new(monster_params)
    if @monster.save
      redirect_to edit_monster_path(@monster), notice: "Monstruo creado"
    else
      render :new, status: :unprocessable_entity
    end
  end

  
  # Se actualiza el monstruo
  def update
    monster
    if monster.update(monster_params)
      redirect_to monsters_path, notice: "Monstruo editado"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def monster_params
    params.requiere(:monster).permit(:name, :description, :phone, :birthdate)
  end

end
