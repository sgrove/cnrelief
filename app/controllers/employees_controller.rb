class EmployeesController < ApplicationController
  before_filter :require_login
  
  before_filter :get_company
  before_filter :get_employee, :except => [:index, :new, :create]

  # Permissions checking. Should be moved to model?
  before_filter :has_permission_to_create, :only => [:create]
  before_filter :has_permission_to_update, :only => [:update]
  before_filter :has_permission_to_destroy, :only => [:destroy]

  def index
    search = params[:search] || params[:text] || "*"
    @employees = @company.employees.named_like(search)

    respond_to do |format|
      format.html
      format.xml { render :xml => @employees.to_xml }
      format.js {
        @e = []
        @employees.each do |employee|
          @e << {"#{employee.id}".to_sym => "#{employee.contact.first} #{employee.contact.last}"}
        end
        render :json => @e.to_json}
    end
  end

  def show
  end

  def new
    @employee = @company.employees.new
  end

  def create
    @employee = Employee.new(params[:employee])

    # TODO: iPhone interface probably isn't important here
    respond_to do |format|
      if @employee.save
        flash[:notice] << "Great, we've added #{@employee} to your employees!"
        redirect_to :action => "index" # Should this redirect to show instead?
        format.html { redirect_to :action => "index" }
        format.xml  { head :ok }
      else
        flash[:warning] << "There were some problems creating this new employee."
        format.html { render :action => "edit" }
        format.xml  { render :xml => @employee.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @employee.update_attributes(params[:employee])
        flash[:notice] = 'Your employee was successfully updated.'
        format.html { redirect_to(@employee) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @employee.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @employee.destroy
    flash[:notice] << "Employee #{@employee} has been removed"
    redirect_to company_employees_path( @company )
  end
  
  protected

  def require_login
    redirect_to login_path unless current_user.logged_in?
  end

  def get_company
    @company = current_user.company
  end

  def get_employee
    @employee = @company.employees.find(params[:employee_id])
  end

  # TODO: Replace these with magic has_permission_to_* ? Would make it read more nicely
  def has_permission_to_create
    flash[:warnings] = "Sorry, you don't have permission to do that." and redirect_to :back unless current_user.has_permission_to "create_employee"
  end

  def has_permission_to_update
    flash[:warnings] = "Sorry, you don't have permission to do that." and redirect_to :back unless current_user.has_permission_to "update_employee"
  end

  def has_permission_to_destroy
    flash[:warnings] = "Sorry, you don't have permission to do that." and redirect_to :back unless current_user.has_permission_to "destroy_employee"
  end
end
