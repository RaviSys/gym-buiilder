class Admin::MembersController < AdminController
  before_action :set_member, only: %i[ show edit update destroy ]

  def index
    @q = Member.ransack(params[:q])
    @members = @q.result(distinct: true)
  end

  def show; end

  def new
    @member = Member.new
  end

  def edit; end

  def create
    @member = Member.new(member_params)
    respond_to do |format|
      if @member.save
        plan = Plan.find(params[:member][:member_plan])
        if plan.monthly?
          member_plan = MemberPlan.new(MemberPlan.monthly_plan.merge(member_id: @member.id, plan_id: plan.id))
        elsif plan.quarterly?
          member_plan = MemberPlan.new(MemberPlan.quarterly_plan.merge(member_id: @member.id, plan_id: plan.id))
        elsif plan.yearly?
          member_plan = MemberPlan.new(MemberPlan.yearly_plan.merge(member_id: @member.id, plan_id: plan.id))
        end
        member_plan.save
        format.html { redirect_to admin_members_path, notice: 'Member was successfully created.' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to admin_members_path, notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to admin_members_url, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def member_params
      params.require(:member).permit(:first_name, :last_name, :contact_number, :email, :city, :state, :country, :zipcode, :address, :gender, :date_of_birth)
    end
end
