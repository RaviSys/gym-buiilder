class Admin::ContactsController < AdminController
  before_action :set_contact, only: %i[ show destroy ]

  def index
    @q = Contact.ransack(params[:q])
    @contacts = @q.result(distinct: true)
    respond_to do |format|
      format.html
      format.csv { send_data @contacts.to_csv(['name', 'email', 'contact_number', 'message']) }
    end
  end

  def show; end

  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to admin_contacts_url, notice: "Contact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end
end
