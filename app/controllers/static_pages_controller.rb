class StaticPagesController < ApplicationController
  def contact_us
    @contact = Contact.new
  end

  def about_us; end
end
