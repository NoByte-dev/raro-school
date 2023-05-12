class PeopleController < ApplicationController
  def index
    @people = Person.all.order(created_at: :asc)
  end

  def show
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new
  end

  def edit
    @person = Person.find(params[:id])
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to person_path(@person)
    else
      render :new
    end
  end

  def update
    @person = Person.find(params[:id])
    if @person.update(person_params)
      flash[:success] = "Successfully updated"
      redirect_to @person
    else
      flash[:error] = "Something went wrong"
      render :edit
    end
  end

  def destroy
    @person = Person.find(params[:id])
    if @person.destroy
      flash[:success] = 'Successfully deleted.'
      redirect_to person_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to person_path
    end
  end

  private

  def person_params
    params.require(:person).permit(:name, :age, :gender, :bio, :cpf)
  end
end
