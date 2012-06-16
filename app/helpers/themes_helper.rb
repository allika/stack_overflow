module ThemesHelper
  def setup_theme(theme)
    theme.comments.build
    theme
  end
end
