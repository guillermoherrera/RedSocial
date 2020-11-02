class UsuariosController < ApplicationController
    before_action :set_user

    def show
        
    end

    def update
        respond_to do |format|
            if @user.update(user_params)
                format.html {redirect_to @user, notice: "Usuario Actualizado"}
            else
                format.html {redirect_to @user, alert: "#{@user.errors.full_messages[0]}"}
            end
        end
    end

    private
    
    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:nombre, :apeellido, :bio)
    end
end