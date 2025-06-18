class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:success] = " Thank You For your message "
      redirect_to root_path
    else
      render :new, status: :unproccessable_entity
    end
  end
  private 
  def contact_params 
    params.require(:contact).permit(:name,:email, :message)
  end
end
