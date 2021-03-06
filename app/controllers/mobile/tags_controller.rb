class Mobile::TagsController < Mobile::ApplicationController
  caches_action :index, :cache_path => Proc.new { |c| c.request.url + '-mobile' }, :expires_in => 6.hours
  caches_action :show, :cache_path => Proc.new { |c| c.request.url + '-mobile' }, :expires_in => 6.hours  
  
  def index
    @tags = Tag.order('id DESC').paginate(page: params[:page], per_page: 60)

    set_meta title: '热门标签'
  end

  def show
    @tag = Tag.find_by slug: params[:id]
    @articles = @tag.articles.order('id DESC').paginate(page: params[:page], per_page: 20)

    set_meta title: [@tag.name, @tag.seo_title.presence || nil].compact.join('_'),
                  description: @tag.seo_description,
                  keywords: @tag.seo_keywords.presence || @tag.name 
  end
end