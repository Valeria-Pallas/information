class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def create
    # Encuentra al usuario por su dirección de correo electrónico
    user = User.find_by(email: params[:session][:email])

    # Verifica si el usuario existe y si la contraseña es válida
    if user && user.authenticate(params[:session][:password])
      # Inicia sesión al usuario
      log_in user

      # Redirige a una página después de iniciar sesión (por ejemplo, la página de perfil)
      redirect_to user
    else
      # Muestra un mensaje de error y vuelve al formulario de inicio de sesión
      flash.now[:danger] = 'Dirección de correo electrónico o contraseña incorrecta.'
      render 'new'
    end
  end


  def destroy
    # Cierra la sesión del usuario
    log_out if logged_in

    # Redirige a una página después de cerrar sesión (por ejemplo, la página de inicio)
    redirect_to root_url
  end
end
