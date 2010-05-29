class PatternsController < ApplicationController
  before_filter :authorize_contributor, :except => [:show, :index]
#  caches_action :index, :layout => false

  # GET /patterns
  # GET /patterns.xml
  def index
    page = params[:page] || 1
    @patterns = Pattern.paginate_by_status "approved", :page => page, :per_page => 4, :order => 'name ASC'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patterns }
    end
  end

  # GET /patterns/1
  # GET /patterns/1.xml
  def show
    @pattern = Pattern.find(params[:id])
    @terms = Term.all

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pattern }
    end
  end

  # GET /patterns/new
  # GET /patterns/new.xml
  def new
    @user = User.find_by_id(session[:user_id])
    @pattern = @user.patterns.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pattern }
    end
  end

  # GET /patterns/1/edit
  def edit
    @pattern = Pattern.find(params[:id])
  end

  # POST /patterns
  # POST /patterns.xml
  def create
    @user = User.find_by_id(session[:user_id])
    @pattern = @user.patterns.build(params[:pattern])
    @pattern.status = "needs_approval"

    if @pattern.save
      flash[:notice] = "#{@pattern.name} was successfully created."
      redirect_to(:controller => "thumbnails", :action => "new", :pattern_id => @pattern)
      #      redirect_to(:controller => "edit_history", :action => "add_edit", :id => @pattern)
    else
      render :action => "new" 
    end
  end

  # PUT /patterns/1
  # PUT /patterns/1.xml
  def update
    @pattern = Pattern.find(params[:id])
    @pattern.status = "needs_approval"

    if @pattern.update_attributes(params[:pattern])
      flash[:notice] = "#{@pattern.name} Pattern was successfully updated."
      #      redirect_to(pattern_path(@pattern))
      redirect_to(:controller => 'patterns', :action => 'editing_pattern', :id => @pattern)
    else
      render :action => "edit"
    end
  end

  def rate
    @pattern = Pattern.find(params[:id])
    @pattern.rate(params[:stars], User.find_by_id(session[:user_id]), params[:dimension])
    render :update do |page|
      page.replace_html @pattern.wrapper_dom_id(params), ratings_for(@pattern, params.merge(:wrap => false))
      page.visual_effect :highlight, @pattern.wrapper_dom_id(params)
    end
  end

  # DELETE /patterns/1
  # DELETE /patterns/1.xml
  def destroy
    @pattern = Pattern.find(params[:id])
    @pattern.destroy

    respond_to do |format|
      format.html { redirect_to(patterns_url) }
      format.xml  { head :ok }
    end
  end

  def editing_pattern
    @pattern = Pattern.find(params[:id])
  end

  #  def get_thumbnail
  #    @image = Pattern.find(params[:id]).screenshots.find(:first)
  #    send_data(@image.data,
  #      :filename => @image.name,
  #      :type => @image.content_type,
  #      :disposition => "inline" )
  #  end

  ###########################################################################
  # Second Page: Adding Thumbnail
  ###########################################################################

  # GET /patterns/add_thumbnail/1
  #  def add_thumbnail
  #    @pattern = Pattern.find(params[:id])
  #
  #    respond_to do |format|
  #      format.html # add_examples.html.erb
  #    end
  #  end


  ###########################################################################
  # Second Page: Adding examples
  ###########################################################################

  # GET /patterns/add_examples/1
  def add_examples
    @pattern = Pattern.find(params[:id])
    @pattern.update_attribute(:status, "needs_approval")

    respond_to do |format|
      format.html # add_examples.html.erb
    end
  end

  # POST /patterns/add_screenshot/1
  def add_screenshot
    @pattern = Pattern.find(params[:id])
    @screenshot = Screenshot.new(params[:screenshot])
    @pattern.update_attribute(:status, "needs_approval")

    #    respond_to do |format|
    #      if request.post? and @screenshot.save and @pattern.screenshots << @screenshot
    #        flash[:notice] = 'Screenshot was successfully added.'
    #        format.html { redirect_to :action => "add_examples", :id => @pattern }
    #      else
    #        format.html { render :action => "add_examples", :id => @pattern }
    #      end
    #    end
  end

  # POST /patterns/add_code/1
  def add_code
    @pattern = Pattern.find(params[:id])
    @code = Code.new(params[:code])
    @pattern.update_attribute(:status, "needs_approval")

    #    respond_to do |format|
    #      if request.post? and @code.save and @pattern.codes << @code
    #        flash[:notice] = 'Code screenshot was successfully added.'
    #        format.html { redirect_to :action => "add_examples", :id => @pattern }
    #      else
    #        format.html { render :action => "add_examples", :id => @pattern }
    #      end
    #    end
  end

  ###########################################################################
  # Third Page: Adding Findings
  ###########################################################################


  # GET /patterns/add_findings/1
  def add_findings
    @pattern = Pattern.find(params[:id])
    @pattern.update_attribute(:status, "needs_approval")
    respond_to do |format|
      format.html # add_finding.html.erb
    end
  end

  # POST /patterns/add_accessibility_finding/1
  def add_accessibility_finding
    @pattern = Pattern.find(params[:id])
    accessibility_finding = AccessibilityFinding.new(params[:accessibility_finding])

    respond_to do |format|
      if request.post? and accessibility_finding.save and @pattern.accessibility_findings << accessibility_finding
        flash[:notice] = 'Accessibility Finding was successfully added.'
        format.html { redirect_to :action => "add_findings", :id => @pattern }
      else
        format.html { render :action => "add_findings", :id => @pattern }
      end
    end
  end

  # POST /patterns/add_usability_finding/1
  def add_usability_finding
    @pattern = Pattern.find(params[:id])
    usability_finding = UsabilityFinding.new(params[:usability_finding])

    respond_to do |format|
      if request.post? and usability_finding.save and @pattern.usability_findings << usability_finding
        flash[:notice] = 'Usability Finding was successfully added.'
        format.html { redirect_to :action => "add_findings", :id => @pattern }
      else
        format.html { render :action => "add_findings", :id => @pattern }
      end
    end
  end


  ###########################################################################
  # Third Page: Adding tags and menus
  ###########################################################################


  # GET /patterns/add_tags_and_menus/1
  def add_tags_and_menus
    @pattern = Pattern.find(params[:id])
    @menus = Menu.find(:all, :order => "name DESC")
    @tags = []
    Group.all.each {|group| @tags << group.tag }
    @pattern.update_attribute(:status, "needs_approval")
    respond_to do |format|
      format.html # add_tags_and_menus.html.erb
    end
  end

  # POST /patterns/add_menus
  def add_menu
    @pattern = Pattern.find(params[:id])
    menu = Menu.find(params[:menu_id])

    respond_to do |format|
      if request.post? and @pattern.menus << menu
        flash[:notice] = "#{@pattern.name} was successfully added to #{menu.name}."
        format.html { redirect_to :action => "add_tags_and_menus", :id => @pattern }
      else
        @errors = "Error in adding #{@pattern.name} to #{menu.name}."
        format.html { render :action => "add_tags_and_menus", :id => @pattern }
      end
    end
  end

  # POST /patterns/add_tag_from_list
  def add_tag_from_list
    @pattern = Pattern.find(params[:id])
    tag = Tag.find(params[:tag_id])

    respond_to do |format|
      if request.post? and @pattern.tags << tag
        flash[:notice] = "#{@pattern.name} was successfully added tag: #{tag.name}."
        format.html { redirect_to :action => "add_tags_and_menus", :id => @pattern }
      else
        @errors = "Error in adding #{tag.name} to #{@pattern.name}."
        format.html { render :action => "add_tags_and_menus", :id => @pattern }
      end
    end
  end

  # POST /patterns/add_tag/1
  def add_tag
    @pattern = Pattern.find(params[:id])
    tag = Tag.new(params[:tag])

    respond_to do |format|
      if request.post? and tag.save and @pattern.tags << tag
        flash[:notice] = "#{@pattern.name} was successfully added tag: #{tag.name}."
        format.html { redirect_to :action => "add_tags_and_menus", :id => @pattern }
      else
        @errors = "Error in adding #{tag.name} to #{@pattern.name}."
        format.html { render :action => "add_tags_and_menus", :id => @pattern }
      end
    end
  end


end
