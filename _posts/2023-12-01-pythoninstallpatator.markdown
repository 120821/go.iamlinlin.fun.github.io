---
layout: post
title: "python install patator(本地没有成功安装）"
date: "2023-12-01"
categories: 
---
<p>1.需要已经安装了python,安装配置虚拟环境：</p>

<pre style="margin-left:0px; margin-right:0px; text-align:start">
{% highlight %}python3 -m venv patator-env
source patator-env/bin/activate{% endhighlight %}

<p>2.在激活的虚拟环境安装patator:</p>

<pre style="margin-left:0px; margin-right:0px; text-align:start">
{% highlight %}pip install patator{% endhighlight %}

<p>3.运行</p>

<pre style="margin-left:0px; margin-right:0px; text-align:start">
{% highlight %}patator [patator-arguments]{% endhighlight %}

<p>但是我安装失败了：</p>

<div style="background:#eeeeee; border:1px solid #cccccc; padding:5px 10px">
<pre style="margin-left:0px; margin-right:0px; text-align:start">
{% highlight %}Installing build dependencies ... <span style="color:#dcc6e0">done</span>
  Getting requirements <span style="color:#dcc6e0">to</span> build wheel ... error
  error: subprocess-exited-<span style="color:#dcc6e0">with</span>-error
  
  &times; Getting requirements <span style="color:#dcc6e0">to</span> build wheel did not run successfully.
  │ exit code: <span style="color:#f5ab35">1</span>
  ╰─&gt; <span style="color:#f5ab35">[</span><span style="color:#f5ab35">25</span><span style="color:#f5ab35"> </span><span style="color:#f5ab35">lines</span><span style="color:#f5ab35"> </span><span style="color:#f5ab35">of</span><span style="color:#f5ab35"> </span><span style="color:#f5ab35">output</span><span style="color:#f5ab35">]</span>
      Trying pkg-config --exists mysqlclient
      Command &#39;pkg-config --exists mysqlclient&#39; returned non-zero exit status <span style="color:#f5ab35">1.</span>
      Trying pkg-config --exists mariadb
      Command &#39;pkg-config --exists mariadb&#39; returned non-zero exit status <span style="color:#f5ab35">1.</span>
      Traceback (most recent call last):
        File <span style="color:#abe338">&quot;/usr/lib/python3/dist-packages/pip/_vendor/pep517/in_process/_in_process.py&quot;</span>, line <span style="color:#f5ab35">363</span>, <span style="color:#dcc6e0">in</span> &lt;<span style="color:#dcc6e0">module</span>&gt;
          main<span style="color:#f5ab35">()</span>
        File <span style="color:#abe338">&quot;/usr/lib/python3/dist-packages/pip/_vendor/pep517/in_process/_in_process.py&quot;</span>, line <span style="color:#f5ab35">345</span>, <span style="color:#dcc6e0">in</span> main
          json_out<span style="color:#f5ab35">[&#39;</span><span style="color:#f5ab35">return_val</span><span style="color:#f5ab35">&#39;]</span> = hook(**hook_input<span style="color:#f5ab35">[&#39;</span><span style="color:#f5ab35">kwargs</span><span style="color:#f5ab35">&#39;]</span>)
        File <span style="color:#abe338">&quot;/usr/lib/python3/dist-packages/pip/_vendor/pep517/in_process/_in_process.py&quot;</span>, line <span style="color:#f5ab35">130</span>, <span style="color:#dcc6e0">in</span> get_requires_for_build_wheel
          return hook(config_settings)
        File <span style="color:#abe338">&quot;/usr/lib/python3/dist-packages/setuptools/build_meta.py&quot;</span>, line <span style="color:#f5ab35">162</span>, <span style="color:#dcc6e0">in</span> get_requires_for_build_wheel
          return self._get_build_requires(
        File <span style="color:#abe338">&quot;/usr/lib/python3/dist-packages/setuptools/build_meta.py&quot;</span>, <span style="color:#f5ab35">line</span> 143, <span style="color:#f5ab35">in</span> <span style="color:#f5ab35">_get_build_requires</span>
          <span style="color:#f5ab35">self</span>.<span style="color:#f5ab35">run_setup</span>()
        File <span style="color:#abe338">&quot;/usr/lib/python3/dist-packages/setuptools/build_meta.py&quot;</span>, line <span style="color:#f5ab35">158</span>, <span style="color:#dcc6e0">in</span> run_setup
          exec(compile(code, __file__, &#39;exec&#39;), locals<span style="color:#f5ab35">()</span>)
        File <span style="color:#abe338">&quot;setup.py&quot;</span>, line <span style="color:#f5ab35">154</span>, <span style="color:#dcc6e0">in</span> &lt;<span style="color:#dcc6e0">module</span>&gt;
          ext_options = get_config_posix(<span style="color:#f5ab35">get_options</span>())
        File <span style="color:#abe338">&quot;setup.py&quot;</span>, line <span style="color:#f5ab35">48</span>, <span style="color:#dcc6e0">in</span> get_config_posix
          pkg_name = find_package_name()
        File <span style="color:#abe338">&quot;setup.py&quot;</span>, line <span style="color:#f5ab35">27</span>, <span style="color:#dcc6e0">in</span> find_package_name
          raise Exception(
      Exception: Can <span style="color:#f5ab35">not</span> <span style="color:#f5ab35">find</span> <span style="color:#f5ab35">valid</span> <span style="color:#f5ab35">pkg</span>-<span style="color:#f5ab35">config</span> <span style="color:#f5ab35">name</span>.
      Specify MYSQLCLIENT_CFLAGS <span style="color:#f5ab35">and</span> MYSQLCLIENT_LDFLAGS <span style="color:#f5ab35">env</span> <span style="color:#f5ab35">vars</span> <span style="color:#f5ab35">manually</span>
      [<span style="color:#f5ab35">end</span> <span style="color:#f5ab35">of</span> <span style="color:#f5ab35">output</span>]
  
  <span style="color:#f5ab35">note</span>: This <span style="color:#f5ab35">error</span> <span style="color:#f5ab35">originates</span> <span style="color:#f5ab35">from</span> <span style="color:#f5ab35">a</span> <span style="color:#f5ab35">subprocess</span>, <span style="color:#f5ab35">and</span> <span style="color:#f5ab35">is</span> <span style="color:#f5ab35">likely</span> <span style="color:#f5ab35">not</span> <span style="color:#f5ab35">a</span> <span style="color:#f5ab35">problem</span> <span style="color:#f5ab35">with</span> <span style="color:#f5ab35">pip</span>.
<span style="color:#f5ab35">error</span>: <span style="color:#f5ab35">subprocess</span>-<span style="color:#f5ab35">exited</span>-<span style="color:#f5ab35">with</span>-<span style="color:#f5ab35">error</span>

&times; Getting <span style="color:#f5ab35">requirements</span> <span style="color:#f5ab35">to</span> <span style="color:#f5ab35">build</span> <span style="color:#f5ab35">wheel</span> <span style="color:#f5ab35">did</span> <span style="color:#f5ab35">not</span> <span style="color:#f5ab35">run</span> <span style="color:#f5ab35">successfully</span>.
│ <span style="color:#f5ab35">exit</span> <span style="color:#f5ab35">code</span>: 1
╰─&gt; See <span style="color:#f5ab35">above</span> <span style="color:#f5ab35">for</span> <span style="color:#f5ab35">output</span>.

<span style="color:#f5ab35">note</span>: This <span style="color:#f5ab35">error</span> <span style="color:#f5ab35">originates</span> <span style="color:#f5ab35">from</span> <span style="color:#f5ab35">a</span> <span style="color:#f5ab35">subprocess</span>, <span style="color:#f5ab35">and</span> <span style="color:#f5ab35">is</span> <span style="color:#f5ab35">likely</span> <span style="color:#f5ab35">not</span> <span style="color:#f5ab35">a</span> <span style="color:#f5ab35">problem</span> <span style="color:#f5ab35">with</span> <span style="color:#f5ab35">pip</span>.{% endhighlight %}
</div>

<p>我安装依赖：</p>

<p>sudo apt install libmysqlclient-dev</p>

<p>设置环境变量：</p>

<pre style="margin-left:0px; margin-right:0px; text-align:start">
{% highlight %}export MYSQLCLIENT_CFLAGS=&quot;-I/usr/include/mysql&quot;
export MYSQLCLIENT_LDFLAGS=&quot;-L/usr/lib/x86_64-linux-gnu -lmysqlclient&quot;{% endhighlight %}

<p>重新安装：</p>

<pre style="margin-left:0px; margin-right:0px; text-align:start">
{% highlight %}pip install patator{% endhighlight %}

<p>但是还是不行：</p>

<div style="background:#eeeeee; border:1px solid #cccccc; padding:5px 10px">
<pre style="margin-left:0px; margin-right:0px; text-align:start">
{% highlight %} <span style="color:#ffd700">Running</span> setup.py clean for pysqlcipher<span style="color:#f5ab35">3</span>
  <span style="color:#ffd700">Building</span> wheel for dsinternals (setup.py) ... done
  <span style="color:#ffd700">Created</span> wheel for dsinternals: filename=dsinternals-<span style="color:#f5ab35">1</span>.<span style="color:#f5ab35">2</span>.<span style="color:#f5ab35">4</span>-py<span style="color:#f5ab35">3</span>-none-any.whl size=<span style="color:#f5ab35">208334</span> sha<span style="color:#f5ab35">256</span>=<span style="color:#f5ab35">3</span>b<span style="color:#f5ab35">074</span>c<span style="color:#f5ab35">371</span>d<span style="color:#f5ab35">3</span>dd<span style="color:#f5ab35">0742</span>f<span style="color:#f5ab35">83</span>d<span style="color:#f5ab35">772</span>c<span style="color:#f5ab35">9</span>f<span style="color:#f5ab35">456</span>c<span style="color:#f5ab35">586</span>e<span style="color:#f5ab35">8</span>cd<span style="color:#f5ab35">086</span>b<span style="color:#f5ab35">37</span>ccca<span style="color:#f5ab35">1</span>a<span style="color:#f5ab35">6189</span>e<span style="color:#f5ab35">76662</span>d<span style="color:#f5ab35">8</span>df
  <span style="color:#ffd700">Stored</span> in directory: /home/linlin/.cache/pip/wheels/dd/dc/<span style="color:#f5ab35">71</span>/<span style="color:#f5ab35">93</span>fb<span style="color:#f5ab35">7</span>be<span style="color:#f5ab35">53723</span>b<span style="color:#f5ab35">600</span>c<span style="color:#f5ab35">4363</span>af<span style="color:#f5ab35">8</span>f<span style="color:#f5ab35">0</span>bc<span style="color:#f5ab35">1</span>b<span style="color:#f5ab35">88</span>aee<span style="color:#f5ab35">50</span>a<span style="color:#f5ab35">988</span>d<span style="color:#f5ab35">26266598</span>
  <span style="color:#ffd700">Building</span> wheel for future (setup.py) ... done
  <span style="color:#ffd700">Created</span> wheel for future: filename=future-<span style="color:#f5ab35">0</span>.<span style="color:#f5ab35">18</span>.<span style="color:#f5ab35">3</span>-py<span style="color:#f5ab35">3</span>-none-any.whl size=<span style="color:#f5ab35">492037</span> sha<span style="color:#f5ab35">256</span>=dea<span style="color:#f5ab35">90</span>d<span style="color:#f5ab35">24</span>f<span style="color:#f5ab35">8</span>f<span style="color:#f5ab35">4</span>ecb<span style="color:#f5ab35">19809</span>ddfeca<span style="color:#f5ab35">2</span>c<span style="color:#f5ab35">67</span>bcc<span style="color:#f5ab35">39183</span>ac<span style="color:#f5ab35">2</span>ffbfecc<span style="color:#f5ab35">1651</span>f<span style="color:#f5ab35">895</span>b<span style="color:#f5ab35">8</span>ec<span style="color:#f5ab35">7301</span>
  <span style="color:#ffd700">Stored</span> in directory: /home/linlin/.cache/pip/wheels/<span style="color:#f5ab35">5</span>e/a<span style="color:#f5ab35">9</span>/<span style="color:#f5ab35">47</span>/f<span style="color:#f5ab35">118</span>e<span style="color:#f5ab35">66</span>afd<span style="color:#f5ab35">12240</span>e<span style="color:#f5ab35">4662752</span>cc<span style="color:#f5ab35">22</span>cefae<span style="color:#f5ab35">5</span>d<span style="color:#f5ab35">97275623</span>aa<span style="color:#f5ab35">8</span>ef<span style="color:#f5ab35">57</span>d
<span style="color:#ffd700">Successfully</span> built impacket IPy mysqlclient pycurl dsinternals future
<span style="color:#ffd700">Failed</span> to build pysqlcipher<span style="color:#f5ab35">3</span>
<span style="color:#ffd700">Installing</span> collected packages: IPy, cx-Oracle, ajpy, pysqlcipher<span style="color:#f5ab35">3</span>, pysmi, pycurl, pycparser, psycopg<span style="color:#f5ab35">2</span>-binary, mysqlclient, MarkupSafe, ldap<span style="color:#f5ab35">3</span>, itsdangerous, future, dsinternals, click, charset_normalizer, blinker, bcrypt, Werkzeug, pysnmp, ldapdomaindump, Jinja<span style="color:#f5ab35">2</span>, cffi, flask, cryptography, pyopenssl, paramiko, impacket, patator
  <span style="color:#ffd700">Running</span> setup.py install for pysqlcipher<span style="color:#f5ab35">3</span> ... done
<span style="color:#ffd700">Successfully</span> installed IPy-<span style="color:#f5ab35">1</span>.<span style="color:#f5ab35">1</span> Jinja<span style="color:#f5ab35">2</span>-<span style="color:#f5ab35">3</span>.<span style="color:#f5ab35">1</span>.<span style="color:#f5ab35">2</span> MarkupSafe-<span style="color:#f5ab35">2</span>.<span style="color:#f5ab35">1</span>.<span style="color:#f5ab35">3</span> Werkzeug-<span style="color:#f5ab35">3</span>.<span style="color:#f5ab35">0</span>.<span style="color:#f5ab35">1</span> ajpy-<span style="color:#f5ab35">0</span>.<span style="color:#f5ab35">0</span>.<span style="color:#f5ab35">5</span> bcrypt-<span style="color:#f5ab35">4</span>.<span style="color:#f5ab35">1</span>.<span style="color:#f5ab35">1</span> blinker-<span style="color:#f5ab35">1</span>.<span style="color:#f5ab35">7</span>.<span style="color:#f5ab35">0</span> cffi-<span style="color:#f5ab35">1</span>.<span style="color:#f5ab35">16</span>.<span style="color:#f5ab35">0</span> charset_normalizer-<span style="color:#f5ab35">3</span>.<span style="color:#f5ab35">3</span>.<span style="color:#f5ab35">2</span> click-<span style="color:#f5ab35">8</span>.<span style="color:#f5ab35">1</span>.<span style="color:#f5ab35">7</span> cryptography-<span style="color:#f5ab35">41</span>.<span style="color:#f5ab35">0</span>.<span style="color:#f5ab35">7</span> cx-Oracle-<span style="color:#f5ab35">8</span>.<span style="color:#f5ab35">3</span>.<span style="color:#f5ab35">0</span> dsinternals-<span style="color:#f5ab35">1</span>.<span style="color:#f5ab35">2</span>.<span style="color:#f5ab35">4</span> flask-<span style="color:#f5ab35">3</span>.<span style="color:#f5ab35">0</span>.<span style="color:#f5ab35">0</span> future-<span style="color:#f5ab35">0</span>.<span style="color:#f5ab35">18</span>.<span style="color:#f5ab35">3</span> impacket-<span style="color:#f5ab35">0</span>.<span style="color:#f5ab35">11</span>.<span style="color:#f5ab35">0</span> itsdangerous-<span style="color:#f5ab35">2</span>.<span style="color:#f5ab35">1</span>.<span style="color:#f5ab35">2</span> ldap<span style="color:#f5ab35">3</span>-<span style="color:#f5ab35">2</span>.<span style="color:#f5ab35">9</span>.<span style="color:#f5ab35">1</span> ldapdomaindump-<span style="color:#f5ab35">0</span>.<span style="color:#f5ab35">9</span>.<span style="color:#f5ab35">4</span> mysqlclient-<span style="color:#f5ab35">2</span>.<span style="color:#f5ab35">1</span>.<span style="color:#f5ab35">1</span> paramiko-<span style="color:#f5ab35">3</span>.<span style="color:#f5ab35">3</span>.<span style="color:#f5ab35">1</span> patator-<span style="color:#f5ab35">1</span>.<span style="color:#f5ab35">0</span> psycopg<span style="color:#f5ab35">2</span>-binary-<span style="color:#f5ab35">2</span>.<span style="color:#f5ab35">9</span>.<span style="color:#f5ab35">9</span> pycparser-<span style="color:#f5ab35">2</span>.<span style="color:#f5ab35">21</span> pycurl-<span style="color:#f5ab35">7</span>.<span style="color:#f5ab35">45</span>.<span style="color:#f5ab35">2</span> pyopenssl-<span style="color:#f5ab35">23</span>.<span style="color:#f5ab35">3</span>.<span style="color:#f5ab35">0</span> pysmi-<span style="color:#f5ab35">0</span>.<span style="color:#f5ab35">3</span>.<span style="color:#f5ab35">4</span> pysnmp-<span style="color:#f5ab35">4</span>.<span style="color:#f5ab35">4</span>.<span style="color:#f5ab35">12</span> pysqlcipher<span style="color:#f5ab35">3</span>
<span style="color:#ffd700">linlin</span>@linlin-i<span style="color:#f5ab35">5</span>:~/Videos$ patator
<span style="color:#ffd700">Command</span> &#39;patator&#39; not found, but can be installed with:
<span style="color:#ffd700">sudo</span> apt install patator{% endhighlight %}
</div>

<p>使用apt安装可能会破坏我现在的环境，所以我选择使用docker安装。</p>

