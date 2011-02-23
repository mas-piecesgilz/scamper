class LeaveforstudentsController < ApplicationController
  # GET /leaveforstudents
  # GET /leaveforstudents.xml
  def index
    @leaveforstudents = Leaveforstudent.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @leaveforstudents }
    end
  end

  # GET /leaveforstudents/1
  # GET /leaveforstudents/1.xml
  def show
    @leaveforstudent = Leaveforstudent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @leaveforstudent }
    end
  end

  # GET /leaveforstudents/new
  # GET /leaveforstudents/new.xml
  def new
    @leaveforstudent = Leaveforstudent.new
    @student = [ ]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @leaveforstudent }
    end
  end

  # GET /leaveforstudents/1/edit
  def edit
    @leaveforstudent = Leaveforstudent.find(params[:id])
  end

  # POST /leaveforstudents
  # POST /leaveforstudents.xml
  def create
    @leaveforstudent = Leaveforstudent.new(params[:leaveforstudent])

    respond_to do |format|
      if @leaveforstudent.save
        flash[:notice] = 'Leaveforstudent was successfully created.'
        format.html { redirect_to(@leaveforstudent) }
        format.xml  { render :xml => @leaveforstudent, :status => :created, :location => @leaveforstudent }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @leaveforstudent.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /leaveforstudents/1
  # PUT /leaveforstudents/1.xml
  def update
    @leaveforstudent = Leaveforstudent.find(params[:id])

    respond_to do |format|
      if @leaveforstudent.update_attributes(params[:leaveforstudent])
        flash[:notice] = 'Leaveforstudent was successfully updated.'
        format.html { redirect_to(@leaveforstudent) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @leaveforstudent.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /leaveforstudents/1
  # DELETE /leaveforstudents/1.xml
  def destroy
    @leaveforstudent = Leaveforstudent.find(params[:id])
    @leaveforstudent.destroy

    respond_to do |format|
      format.html { redirect_to(leaveforstudents_url) }
      format.xml  { head :ok }
    end
  end
  
  def update_matrixno
    @stdmatrix = Student.find(:all, :conditions => ["student_id like ?", "%" + params[:std_matrixno]])
    
    if params[:id]
      @stdmatrix =Student.find(:all)
      render :partial => 'stdmatrix', :collection => @stdmatrix
    else
      render :text => "Result not found", :layout =>false
    end
    respond_to do |format|
    format.html
    format.json {render :json => @student }
  end
  end

end
