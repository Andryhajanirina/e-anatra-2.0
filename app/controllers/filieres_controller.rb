class FilieresController < ApplicationController
  def new
   # if user_signed_in? && current_user.role == "responsable"
      
    #  if current_user.etab   
        @fil = Filiere.new
     # else
      #  redirect_to new_etab_path
     # end
    #else
     # redirect_to new_user_registration_path
    #end
  end

  def create
      params_fil = params.require(:filiere).permit(:filiere)
      @fil = Filiere.new(params_fil)
      @etab = current_user.etab
      @etab.filieres << @fil
        
      if @fil.save
        redirect_to etabs_path
      else
        redirect_to new
      end
  end


end
