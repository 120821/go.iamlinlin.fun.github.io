require 'fileutils'

folder_path = './_posts'  # 替换为您的文件夹路径

Dir.glob(File.join(folder_path, '**', '*.markdown')).each do |file|
  lines = File.readlines(file)
  title_line = lines.find { |line| line.start_with?('title:') }
  title = title_line&.strip&.gsub(/^title:\s*/, '')  # 提取标题，删除开头的 "title: " 字符串
  new_content = lines.join('').sub(title_line, "title: #{title}\n")  # 替换新的 YAML 头部
  File.open(file, 'w') { |f| f.write(new_content) }  # 写入更新后的内容
end
