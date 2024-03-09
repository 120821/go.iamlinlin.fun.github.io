---
layout: post
title: "aws服务器上Ubuntu磁盘扩容"
date: "2023-06-21"
categories: 
---
<p>1. 以下是在AWS EC2上运行的Ubuntu服务器上扩展磁盘的示例步骤：</p>

<ol>
	<li>登录到你的 AWS EC2 控制台，并找到你的实例。</li>
	<li>停止实例：选择你的实例，点击 &quot;Actions&quot; 按钮，然后选择 &quot;Stop Instance&quot;。</li>
	<li>在实例停止后，选择你的实例，点击 &quot;Actions&quot; 按钮，然后选择 &quot;Instance Settings&quot; &gt; &quot;Change Termination Protection&quot;，确保终止保护已关闭。</li>
	<li>在实例停止后，选择你的实例，点击 &quot;Actions&quot; 按钮，然后选择 &quot;Create Image&quot;，这将创建一个 AMI (Amazon Machine Image)。</li>
	<li>选择创建 AMI 后，等待 AMI 创建完成。</li>
	<li>在 AMI 创建完成后，选择你的实例，点击 &quot;Actions&quot; 按钮，然后选择 &quot;Instance State&quot; &gt; &quot;Launch More Like This&quot;。这将创建一个基于你的 AMI 的新实例，该实例将具有与原实例相同的配置。</li>
	<li>在 Launch More Like This 页面中，将 &quot;Storage&quot; 部分的 &quot;Root volume&quot; 大小增加到你想要的大小，并选择 &quot;Add New Volume&quot; 来创建一个新的附加卷。</li>
	<li>启动新实例。</li>
	<li>连接到新的实例，使用 SSH 登录。</li>
	<li>在命令行中，执行以下命令来查看新创建附加卷的设备名称和文件系统：
	<pre>
<code>sudo fdisk -l{% endhighlight %}
	</li>
	<li>使用以下命令来创建一个新的分区，使用整个附加卷大小：
	<pre>
<code>sudo parted /dev/nvme1n1 mklabel gpt
sudo parted /dev/nvme1n1 mkpart primary ext4 0% 100%
sudo mkfs -t ext4 /dev/nvme1n1p1{% endhighlight %}
	确保将 &quot;/dev/nvme1n1&quot; 替换为你实际的附加卷设备名称。</li>
	<li>使用以下命令来挂载新的分区：
	<pre>
<code>sudo mkdir /mnt/new_disk
sudo mount /dev/nvme1n1p1 /mnt/new_disk{% endhighlight %}
	</li>
	<li>使用以下命令将新分区挂载到 <code>/etc/fstab</code> 文件中，以便在系统重新启动后自动挂载：
	<pre>
<code>sudo cp /etc/fstab /etc/fstab.bak
echo &#39;/dev/nvme1n1p1 /mnt/new_disk ext4 defaults 0 0&#39; | sudo tee -a /etc/fstab{% endhighlight %}
	</li>
	<li>现在，你可以通过使用以下命令验证新分区是否已成功挂载：
	<pre>
<code>df -h{% endhighlight %}
	确保 <code>/mnt/new_disk</code> 显示已挂载的新分区。</li>
</ol>

<p>通过按照以上步骤在 AWS EC2 上扩展Ubuntu服务器的磁盘，你可以成功增加服务器上的可用磁盘空间。</p>

<p>2.如果你不想创建新的分区，而是在旧的分区上增加空间，你可以按照以下步骤执行：</p>

<ol>
	<li>
	<p>连接到你的服务器，使用 SSH 登录。</p>
	</li>
	<li>
	<p>在命令行中，执行以下命令来查看现有分区和文件系统的信息：</p>

	<pre>
<code>df -h{% endhighlight %}

	<p>这将显示当前的磁盘使用情况。</p>
	</li>
	<li>
	<p>在命令行中，执行以下命令来查看附加卷的设备名称：</p>

	<pre>
<code>sudo fdisk -l{% endhighlight %}

	<p>在输出中，找到你要扩展的附加卷设备名称（如 <code>/dev/xvdf</code>）。</p>
	</li>
	<li>
	<p>在命令行中，执行以下命令来扩展文件系统：</p>

	<pre>
<code>sudo resize2fs /dev/xvdf{% endhighlight %}

	<p>确保将 <code>/dev/xvdf</code> 替换为你实际的附加卷设备名称。</p>
	</li>
</ol>

<p>这将扩展文件系统以使用整个可用空间。</p>

<ol start="5">
	<li>再次执行以下命令来查看磁盘使用情况：
	<pre>
<code>df -h{% endhighlight %}
	验证扩展是否成功，并且你现在拥有了更多的可用磁盘空间。</li>
</ol>

<p>通过按照以上步骤在 AWS EC2 上扩展现有分区的磁盘空间，你可以在不创建新的分区的情况下增加服务器上的可用磁盘空间</p>

<p>3. 解释：</p>

<p>如果你在控制台上扩容了磁盘空间，但没有在命令行上执行分区、格式化等操作，那么新的空间是无法被操作系统识别和使用的。</p>

<p>当你扩容了磁盘空间后，操作系统不会自动将其识别为可用的空间。你需要手动进行分区和格式化的操作，以便让操作系统能够使用新的空间。</p>

<p>具体的步骤可能因操作系统而异，以下是一般的步骤：</p>

<ol>
	<li>
	<p>确认新的空间已经可用。你可以使用命令行工具（如<code>lsblk</code>或<code>fdisk -l</code>）来查看磁盘的分区情况。</p>
	</li>
	<li>
	<p>使用分区工具（如<code>fdisk</code>或<code>parted</code>）对磁盘进行分区。你可以创建一个新的分区，或者将新的空间添加到已有的分区中。</p>
	</li>
	<li>
	<p>格式化分区。使用命令（如<code>mkfs.ext4</code>或<code>mkfs.xfs</code>）对分区进行格式化，使其成为可用的文件系统。</p>
	</li>
	<li>
	<p>挂载分区。使用命令（如<code>mount</code>）将分区挂载到目标目录，使其成为可访问的文件系统。</p>
	</li>
</ol>

<p>完成以上步骤后，你就可以使用新的磁盘空间了。请注意，这些操作可能会导致数据丢失，请务必提前备份重要的数据，并小心执行这些操作</p>

