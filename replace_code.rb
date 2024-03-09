require 'fileutils'

folder_path = './_posts'  # 替换为你的文件夹路径

Dir.glob(File.join(folder_path, '**', '*')).select { |file| File.file?(file) }.each do |file|
  content = File.read(file)
#new_content = content.gsub('<pre><code>', '{% highlight %}').gsub('</code></pre>', '{% endhighlight %}')
   new_content = content.gsub('<pre>', '{% highlight %}').gsub('</pre>', '{% endhighlight %}').gsub('<code>', '{% highlight %}').gsub('</code>', '{% endhighlight %}')
  File.open(file, 'w') { |f| f.write(new_content) }
end
