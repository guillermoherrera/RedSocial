class UsuariosController < ApplicationController
    before_action :set_user
    before_action :authenticate_user!, only: [:update]
    before_action :authenticate_owner!, only: [:update]

    def show
        @its_me = @user == current_user
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

    def authenticate_owner!
        if @user != current_user
            redirect_to root_path, alert:"Accion no valida", status: :unauthorized
        end
    end

    def user_params
        params.require(:user).permit(:nombre, :apeellido, :bio)
    end
end