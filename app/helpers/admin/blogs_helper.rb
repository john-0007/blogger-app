module Admin
  module BlogsHelper
    class << self
      def render_state(view)
        view.sanitize(statuses(view).map do |status, path|
          view.content_tag :li, class: "item #{active(view,path)}" do
            view.link_to status, path
          end
        end.join)
      end

      private

      def active(view,path)
        view.current_page?(path) ? 'active' : nil
      end

      def statuses(view)
        { 'all' => view.admin_blogs_path }.merge(
          Blog.statuses.keys.inject({}) do |hash, status|
            hash.merge(status => view.by_status_admin_blogs_path(status))
          end
        )
      end
    end
  end
end
# {
#   all: "view.admin_blogs_path",
#   draft: "view.by_status_admin_blogs_path(draft)",
#   published: "view.by_status_admin_blogs_path(published)"
# }
# what is this view 
