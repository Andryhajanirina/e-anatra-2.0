class ContactMailer < ApplicationMailer
    default from: 'andryhaj@gmail.com'
    def contact(destinataire, message)
        @destinataire = destinataire
        @message = message
        # mail :subject => "#{message[:subject]} from: #{message[:name]}",
        # :to      => "eanatramada@gmail.com",
        # :from    => message[:email],
        # :body => message[:message]#message[:body]
        mail(to: "#{@destinataire.email}", subject:"#{@message.subject}")
    end

    def new_subscription(responsable)
        @responsable = responsable
        mail(to: "#{@responsable}", subject:"nouvelle inscription")
        
    end
    def inscrit(etudiant)
        @etudiant = etudiant
        mail(to: "#{@etudiant}", subject:"inscription reussi")
    end
end
