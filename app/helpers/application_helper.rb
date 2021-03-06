# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def notice
    # XXX Replace with flash conductor plugin?
    unless flash.blank?
      content_tag("div", :id => "flash", :class => "flash") do
        flash.keys.map do |key|
          content_tag("p", flash[key], :class => key)
        end.join("\n")
      end
    end
  end

  def preserve_formatting_of(text)
    content_tag("div", simple_format(escape_once(text)), :class => :compressed)
  end

  def inline_button_to(*args)
    html = button_to(*args)
    html.gsub!(/<div>(.*)/, '<div class="inlined">\1')
    html.gsub!(/class="button-to"/m, 'class="button-to inlined"\1')
    html
  end

  def include_jwysiwyg
    return if defined?(@jwysiwyg_included) && @jwysiwyg_included
    content_for(:stylesheets, stylesheet_link_tag("jquery.wysiwyg.css"))
    content_for(:scripts,javascript_include_tag("jquery.wysiwyg.pack.js") + <<-HERE
    <script type="text/javascript">
      /*<![CDATA[*/
      $(function()
      {
          $('textarea.rich').wysiwyg({
            controls: {
              separator00: { visible: true },
              justifyLeft: { visible: true },
              justifyCenter: { visible: true },
              justifyRight: { visible: true },
              separator04: { visible: true },
              insertOrderedList: { visible: true },
              insertUnorderedList: { visible: true },
              html: { visible: true }
            }
          });
      });
      /*]]>*/
    </script>
    HERE
    )
    @jwysiwyg_included = true
  end

  # Add the +html+ to the stylesheets of the layout. Example:
  #   <%= add_stylesheet(stylesheet_link_tag "custom") %>
  def add_stylesheet(html)
    content_for :stylesheets, html
  end

  # Add the +html+ to the javascripts portion of the layout. Example:
  #   <%= add_javascripts(javascript_include_tag "application") %>
  def add_javascript(html)
    content_for :scripts, html
  end

  # Indents a block of code to a specified minimum indent level.
  def indent_block(string, level=0)
    lines = string.to_a
    common_space = lines.map{|line| line.length - line.lstrip.length}.min
    string.to_a.map{ |line| ('  ' * level) + line[common_space..-1] }.join
  end

  # Exposes a value as a property of the JavaScript 'app' object.
  #   Example:
  #     <% expose_to_js :current_user_id, current_user.id %>
  #     <script> alert(app.current_user_id); </script>
  #
  def expose_to_js(key, value)
    raise(ArgumentError, "key must be a symbol") unless key.is_a?(Symbol)
    value = "'#{value}'" unless value.is_a?(Integer) || value.bool?
    content_for :javascript_expose_values, "app.#{key.to_s} = #{value};\n"
  end

  # Enqueues the given javascript code to run once the DOM is ready.
  def run_when_dom_is_ready(javascript)
    content_for :javascript_on_ready, javascript + "\n"
  end

  # Is the navigation item the currently viewed page? E.g., if the navigation is :sessions, is the :subnav also :sessions.
  def nav_current_page_item?
    return(nav_kind == subnav_kind)
  end

  # Is the current action related to proposals?
  def proposal_related_action?
    return controller.kind_of?(ProposalsController) && ! ProposalsController::SESSION_RELATED_ACTIONS.include?(action_name)
  end

  # Is the current action related to sessions?
  def session_related_action?
    return (controller.kind_of?(EventsController) && action_name == "speakers") || controller.kind_of?(ProposalsController) && ProposalsController::SESSION_RELATED_ACTIONS.include?(action_name)
    # TODO Make this logic clearer and the menu system less crazy.
  end

  # Main navigation to display.
  def nav_kind
    if @event && @event.proposal_status_published?
      return :sessions
    else
      return :proposals
    end
  end

  # Main navigation path to use.
  def nav_path
    return self.send("#{nav_kind}_path")
  end

  # Main navigation title.
  def nav_title
    return self.nav_kind.to_s.titleize
  end

  # Subnavigation to display.
  def subnav_kind
    if @event
      if @event.proposal_status_published?
        proposal_related_action? ? :proposals : :sessions
      else
        session_related_action? ? :sessions : :proposals
      end
    else
      :proposals
    end
  end

  # Subnavigation path.
  def subnav_path
    return self.send("#{subnav_kind}_path")
  end

  # Subnavigation title.
  def subnav_title
    return self.subnav_kind.to_s.titleize
  end
end
