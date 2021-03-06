class Admin::CacheController < Admin::ApplicationController
  def refresh
    # if params[:cache_name] == 'desktop/index'
    #   # expire_page '/page_cache/desktop/index'
    # else
    # expire_fragment(params[:cache_name])
    # end
    system "cd #{Rails.root.join('public/cached_pages').to_s}; rm -rf index.html"
    redirect_to admin_cache_path
  end

  def refresh_all
    system "echo 'flush_all' | nc localhost 11211"
    system "cd #{Rails.root.join('public/cached_pages').to_s}; rm -rf *.html"
    redirect_to admin_cache_path
  end

  # def precompile
  #   env = Rails.env.development? ? 'development' : 'production'
  #   system "RAILS_ENV=#{env} rake tmp:clear; RAILS_ENV=#{env} rake assets:precompile"
  #   redirect_to admin_cache_path
  # end

  # def restart
  #   if Rails.env.production?
  #     system 
  #   end

  #   redirect_to admin_cache_path
  # end

  # def recache_index
  #   cache_views = ['desktop/index', 'mobile/index']
  #   cache_views.each do |view|
  #     expire_fragement(view)
  #     curl " 127.0.0.1:7654", view.include?('mobile')
  #   end
  # end

  # def cache_tag
  # end

  # def cache_channel
  # end

  # def cache_article_list
    
  # end

  private

  def curl(localurl, mobile = false)
    cmd = "curl #{localurl}"
    if mobile
      cmd << ' -A User-agent: Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420.1 (KHTML, like Gecko) Version/3.0 Mobile/3B48b Safari/419.3'
    end

    system cmd
  end
end