class AttendanceMailer < ApplicationMailer
	default from: 'diallokidi31@gmail.com'
 
  def notify_event_participation_to_usercreator(attendance)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @attendance = attendance

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    #@url  = 'http://eventmeet.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @attendance.event.user.email, subject: 'Un participant !') 
  end
end





