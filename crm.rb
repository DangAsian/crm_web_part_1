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
