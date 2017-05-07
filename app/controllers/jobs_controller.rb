class JobsController < ApplicationController

before_action :authenticate_user!, only:[:new, :edit, :create, :update, :destroy]
before_action :validate_search_key, only: [:search]

  def index
    @jobs = case params[:order]
    when 'by_lower_bound'
      Job.published.order('wage_lower_bound DESC').paginate(:page => params[:page], :per_page => 5)
    when 'by_upper_bound'
      Job.published.order('wage_upper_bound DESC').paginate(:page => params[:page], :per_page => 5)
    when 'by_产品经理'
      Job.where(:category => "产品经理").recent.paginate(:page => params[:page], :per_page => 5)
    when 'by_游戏开发'
      Job.where(:category => "游戏开发").recent.paginate(:page => params[:page], :per_page => 5)
    when 'by_新媒体运营'
      Job.where(:category => "新媒体运营").recent.paginate(:page => params[:page], :per_page => 5)
    when 'by_硬件开发'
      Job.where(:category => "硬件开发").recent.paginate(:page => params[:page], :per_page => 5)
    when 'by_web开发'
      Job.where(:category => "web开发").recent.paginate(:page => params[:page], :per_page => 5)
    when 'by_Android开发'
      Job.where(:category => "Android开发").recent.paginate(:page => params[:page], :per_page => 5)
    when 'by_云计算'
      Job.where(:category => "云计算").recent.paginate(:page => params[:page], :per_page => 5)
    when 'by_测试工程师'
      Job.where(:category => "测试工程师").recent.paginate(:page => params[:page], :per_page => 5)
    else
      Job.published.recent.paginate(:page => params[:page], :per_page => 5)
    end
  end


  def new
    @job = Job.new
  end

  def show
    @job = Job.find(params[:id])

    if @job.is_hidden
      flash[:warning] = "This Job already archieved!"
      redirect_to root_path
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to root_path, notice: "岗位更新成功！"
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to root_path, alert: "岗位成功删除!"
  end


  def search
    if @query_string.present?
      search_result = Job.published.ransack(@search_criteria).result(:distinct => true)
      @jobs = search_result.paginate(:page => params[:page], :per_page => 5 )
    end
  end

  # def category
  #   if params[:order1]
  #     @jobs = Job.published.where(:category => "产品经理")
  #   else params[:order1] && params[:order]
  #     @jobs = Job.published.where(:category => "产品经理").order("wage_lower_bound DESC")
  #   end
  # end

  def 产品经理
      @jobs = case params[:order]
              when 'by_lower_bound'
                Job.published.where(:category => "产品经理").lower_salary.paginate(:page => params[:page], :per_page => 5)
              when 'by_upper_bound'
                Job.published.where(:category => "产品经理").upper_salary.paginate(:page => params[:page], :per_page => 5)
              else
                Job.published.where(:category => "产品经理").recent.paginate(:page => params[:page], :per_page => 5)
              end
    end

    def 游戏开发
      @jobs = case params[:order]
              when 'by_lower_bound'
                Job.published.where(:category => "游戏开发").lower_salary.paginate(:page => params[:page], :per_page => 5)
              when 'by_upper_bound'
                Job.published.where(:category => "游戏开发").upper_salary.paginate(:page => params[:page], :per_page => 5)
              else
                Job.published.where(:category => "游戏开发").recent.paginate(:page => params[:page], :per_page => 5)
              end
    end

    def 新媒体运营
      @jobs = case params[:order]
              when 'by_lower_bound'
                Job.published.where(:category => "新媒体运营").lower_salary.paginate(:page => params[:page], :per_page => 5)
              when 'by_upper_bound'
                Job.published.where(:category => "新媒体运营").upper_salary.paginate(:page => params[:page], :per_page => 5)
              else
                Job.published.where(:category => "新媒体运营").recent.paginate(:page => params[:page], :per_page => 5)
              end
    end

    def 硬件开发
      @jobs = case params[:order]
              when 'by_lower_bound'
                Job.published.where(:category => "硬件开发").lower_salary.paginate(:page => params[:page], :per_page => 5)
              when 'by_upper_bound'
                Job.published.where(:category => "硬件开发").upper_salary.paginate(:page => params[:page], :per_page => 5)
              else
                Job.published.where(:category => "硬件开发").recent.paginate(:page => params[:page], :per_page => 5)
              end
    end

    def web开发
      @jobs = case params[:order]
              when 'by_lower_bound'
                Job.published.where(:category => "web开发").lower_salary.paginate(:page => params[:page], :per_page => 5)
              when 'by_upper_bound'
                Job.published.where(:category => "web开发").upper_salary.paginate(:page => params[:page], :per_page => 5)
              else
                Job.published.where(:category => "web开发").recent.paginate(:page => params[:page], :per_page => 5)
              end
    end

    def Android开发
      @jobs = case params[:order]
              when 'by_lower_bound'
                Job.published.where(:category => "Android开发").lower_salary.paginate(:page => params[:page], :per_page => 5)
              when 'by_upper_bound'
                Job.published.where(:category => "Android开发").upper_salary.paginate(:page => params[:page], :per_page => 5)
              else
                Job.published.where(:category => "Android开发").recent.paginate(:page => params[:page], :per_page => 5)
              end
    end

    def 云计算
      @jobs = case params[:order]
              when 'by_lower_bound'
                Job.published.where(:category => "云计算").lower_salary.paginate(:page => params[:page], :per_page => 5)
              when 'by_upper_bound'
                Job.published.where(:category => "云计算").upper_salary.paginate(:page => params[:page], :per_page => 5)
              else
                Job.published.where(:category => "云计算").recent.paginate(:page => params[:page], :per_page => 5)
              end
    end

    def 测试工程师
      @jobs = case params[:order]
              when 'by_lower_bound'
                Job.published.where(:category => "测试工程师").lower_salary.paginate(:page => params[:page], :per_page => 5)
              when 'by_upper_bound'
                Job.published.where(:category => "测试工程师").upper_salary.paginate(:page => params[:page], :per_page => 5)
              else
                Job.published.where(:category => "测试工程师").recent.paginate(:page => params[:page], :per_page => 5)
              end
    end


  protected

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
    @search_criteria = search_criteria(@query_string)
  end


  def search_criteria(query_string)
    { :title_cont => query_string }
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email, :is_hidden, :city, :company, :category)
  end
end
