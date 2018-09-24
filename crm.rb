require_relative 'contact'
require 'sinatra'

    get '/' do
      erb :index
    end

    after do
      ActiveRecord::Base.connection.close
    end

    get '/contacts' do
      @all_contacts = Contact.all
      puts @all_contacts

      @id_number = @all_contacts.size

      erb :contacts
    end

    get '/contacts/new' do

      erb :new
    end
    get '/contacts/:id' do
    @contact = Contact.find_by(id: params[:id].to_i)
    if @contact
      erb :show_contact
    else
      raise Sinatra::NotFound
    end
    end
