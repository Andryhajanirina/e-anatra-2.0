require 'mailjet'
require 'dotenv'
Dotenv.load
class NewsletterController < ApplicationController
  before_action :get_id, only: [:show, :update, :edit, :destroy]

  def index
      @newsletters = Newsletter.all
  end
  
  def new
  end
  
  def create
      @newsletter = Newsletter.create(newsletter_params)
  end
  
  def send_newsletter
    @subject = params[:subject]
    @message = params[:message]
    email = { :from_email   => ENV['FROM_EMAIL'],
            :from_name    => ENV['USER_SENDER'],
            :subject      => "Hello test",
            :text_part    => "Bonjour jenvoie ce mail pour test2",
            :recipients   => [{:email => "eanatramada@gmail.com"}]
          }

    test = Mailjet::Send.create(email)

    # retrieve the API response
    p test.attributes['Sent']
    
    
    # Désinscription d'un mail newsletter
    # def send_unsubscribe
    #   Mailer.send_unsubscribe(selfe).deliver
    # end
    # redirect_to root_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private


    # kindly generated by appropriated Rails generator
    Mailjet.configure do |config|
      config.api_key = ENV['CONFIG_API_KEY']
      config.secret_key = ENV['CONFIG_SECRET_KEY']
      config.default_from = ENV['CONFIG_DEFAULT_FROM']
      # Mailjet API v3.1 is at the moment limited to Send API.
      # We’ve not set the version to it directly since there is no other endpoint in that version.
      # We recommend you create a dedicated instance of the wrapper set with it to send your emails.
      # If you're only using the gem to send emails, then you can safely set it to this version.
      # Otherwise, you can remove the dedicated line into config/initializers/mailjet.rb.
    #   config.api_version = 'v3.1'
    end

  def newsletter_params
    params.require(:newsletter).permit(:email)
  end

  def get_id
    @newsletter = Newsletter.find(params:[:id])
  end
end
  