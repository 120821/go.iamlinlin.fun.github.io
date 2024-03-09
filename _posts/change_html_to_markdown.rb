require 'fileutils'

folder_path = "./posts_new"  # 文件夹的路径

Dir.glob("#{folder_path}/*.html") do |html_file|
  markdown_file = html_file.gsub(".html", ".markdown")
  FileUtils.mv(html_file, markdown_file)
end
