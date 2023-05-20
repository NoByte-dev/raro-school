class PeopleController < ApplicationController
  before_action :fetch_person, only: %i[show edit update destroy]

  def index
    @people = Person.all.order(created_at: :asc)
  end

  def show; end

  def new
    @person = Person.new
  end

  def edit; end

  def create
    @person = Person.new(person_params)

    return redirect_to person_path(@person) if @person.save

    render :new
  end

  def update
    return redirect_to person_path(@person) if @person.update(person_params)

    return redirect_to person_path, notice: 'Alterado com sucesso' if @person.update(person_params)

    render :edit
  end

  def destroy
    @person.destroy

    return redirect_to person_path, notice: 'Apagado com sucesso' if @person.destroy
  end

  private

  def person_params
    params.require(:person).permit(:name, :email, :age, :gender_type, :bio, :cpf)
  end

  def fetch_person
    @person = Person.find(params[:id])
  end
end
