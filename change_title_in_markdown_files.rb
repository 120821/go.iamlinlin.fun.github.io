require 'yaml'
require 'fileutils'

folder_path = './_posts'  # 替换为你的文件夹路径

Dir.glob(File.join(folder_path, '**', '*.markdown')).each do |file|
  content = File.read(file)
  front_matter, body = content.split('---', 3)[1..2]  # 提取 YAML 头部和正文内容
  data = YAML.load(front_matter)  # 解析 YAML 头部
  data['title']&.gsub!(/^"/, '')  # 删除 title 字段开头的双引号
  new_front_matter = data.to_yaml.gsub("---\n", "---\n")  # 重新生成 YAML 头部
  new_content = "#{new_front_matter}---\n#{body}"  # 组合新的文件内容
  File.open(file, 'w') { |f| f.write(new_content) }  # 写入更新后的内容
end
