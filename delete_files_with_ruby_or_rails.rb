require 'fileutils'

def delete_files_with_keywords(folder_path, keywords)
  Dir.glob(File.join(folder_path, '**/*')).each do |file|
    if keywords.any? { |keyword| File.basename(file).include?(keyword) }
      File.delete(file)
      puts "Deleted file: #{file}"
    end
  end
end

# 示例用法
folder_path = './_posts'  # 替换为你的文件夹路径
keywords = ['ruby', 'rails', 'todo']
delete_files_with_keywords(folder_path, keywords)
