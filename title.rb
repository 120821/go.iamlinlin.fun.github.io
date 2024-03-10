require 'fileutils'

folder_path = './_posts'  # 替换为您的文件夹路径

Dir.glob(File.join(folder_path, '**', '*.markdown')).each do |file|
  lines = File.readlines(file)
  title_line_index = lines.find_index { |line| line.start_with?('title:') }
  title_line = lines[title_line_index]
  title = title_line&.strip&.gsub(/^title:\s*['"](.*)['"]$/, '\1')  # 提取标题，并删除中间的双引号
  new_title_line = "title: \"#{title}\"\n"  # 添加新的标题行，保留开头和末尾的双引号
  new_content = lines.join('').sub(title_line, new_title_line)  # 替换新的标题行
  File.open(file, 'w') { |f| f.write(new_content) }  # 写入更新后的内容
end
