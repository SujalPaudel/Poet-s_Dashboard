module BlogsHelper
  def gravatar_helper user
    image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}", width: 60
  end

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div
    end #ability of having code highlighting
  end

  def markdown(text)
    coderayified = CodeRayify.new(filter_html: true, hard_wrap: true)

    options = {
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      auto_link: true, #pass link and get automatically be converted
      lax_html_blocks: true, 
      #all ends up doing syntax highlighting
    }

    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text).html_safe 
  end

  def blog_status_color blog
    'color: red;' if blog.draft?
  end
end






#store text using markdown format, take that markdown, pass it through the filter, and have that filter convert our markdown syntax to HTML format, as we need 


#there is a module which render HTML

#Metaprogramming is a programming technique in which computer programs have the ability to treat programs as their data. It means that a program can be designed to read, generate, analyse or transform other programs, and even modify itself while running.

#program treats another program as a data
#the data for the program is to be manipulated in all case
#Also in this case the program will be manipulated even when it is running