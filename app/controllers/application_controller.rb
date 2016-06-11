class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def create
   Person.create(person_params)
 end

 def update
   redirect_to current_account.people.find(params[:id]).tap { |person|
     person.update!(person_params)
   }
 end
 private

 def person_params
      params.require(:person).permit(:name, :age)
    end
end
