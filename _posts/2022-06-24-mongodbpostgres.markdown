---
layout: post
title: "安装MongoDB 与postgres类似的，可以打开用到的，也就是说安装两个"
date: "2022-06-24"
categories: 
---
<p>source ~/env_file<br />
linlin@linlin-i5:~$ asdf install mongodb 5.0.6<br />
download_url https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-5.0.6.tgz<br />
&nbsp; % Total&nbsp;&nbsp;&nbsp; % Received % Xferd&nbsp; Average Speed&nbsp;&nbsp; Time&nbsp;&nbsp;&nbsp; Time&nbsp;&nbsp;&nbsp;&nbsp; Time&nbsp; Current<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Dload&nbsp; Upload&nbsp;&nbsp; Total&nbsp;&nbsp; Spent&nbsp;&nbsp;&nbsp; Left&nbsp; Speed<br />
100&nbsp;&nbsp; 243&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp; 243&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp; 210&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 --:--:--&nbsp; 0:00:01 --:--:--&nbsp;&nbsp; 210</p>

<p>gzip: stdin: not in gzip format<br />
tar: Child returned status 1<br />
tar: Error is not recoverable: exiting now<br />
linlin@linlin-i5:~$ asdf install mongodb 5.0.6<br />
download_url https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-5.0.6.tgz<br />
&nbsp; % Total&nbsp;&nbsp;&nbsp; % Received % Xferd&nbsp; Average Speed&nbsp;&nbsp; Time&nbsp;&nbsp;&nbsp; Time&nbsp;&nbsp;&nbsp;&nbsp; Time&nbsp; Current<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Dload&nbsp; Upload&nbsp;&nbsp; Total&nbsp;&nbsp; Spent&nbsp;&nbsp;&nbsp; Left&nbsp; Speed<br />
100&nbsp;&nbsp; 243&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp; 243&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp; 199&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 --:--:--&nbsp; 0:00:01 --:--:--&nbsp;&nbsp; 199</p>

<p>gzip: stdin: not in gzip format<br />
tar: Child returned status 1<br />
tar: Error is not recoverable: exiting now<br />
linlin@linlin-i5:~$ asdf install mongodb 5.0.6<br />
download_url https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-5.0.6.tgz<br />
&nbsp; % Total&nbsp;&nbsp;&nbsp; % Received % Xferd&nbsp; Average Speed&nbsp;&nbsp; Time&nbsp;&nbsp;&nbsp; Time&nbsp;&nbsp;&nbsp;&nbsp; Time&nbsp; Current<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Dload&nbsp; Upload&nbsp;&nbsp; Total&nbsp;&nbsp; Spent&nbsp;&nbsp;&nbsp; Left&nbsp; Speed<br />
100&nbsp;&nbsp; 243&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp; 243&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp; 358&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 --:--:-- --:--:-- --:--:--&nbsp;&nbsp; 358</p>

<p>gzip: stdin: not in gzip format<br />
tar: Child returned status 1<br />
tar: Error is not recoverable: exiting now<br />
linlin@linlin-i5:~$ cd ~/.asdf/<br />
linlin@linlin-i5:~/.asdf$ ls<br />
asdf.elv&nbsp;&nbsp; asdf.sh&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; completions&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; defaults&nbsp; downloads&nbsp; installs&nbsp; LICENSE&nbsp; README.md&nbsp;&nbsp; scripts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; shims&nbsp; tmp<br />
asdf.fish&nbsp; ballad-of-asdf.md&nbsp; CHANGELOG.md&nbsp; CONTRIBUTING.md&nbsp; docs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; help.txt&nbsp;&nbsp; lib&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; plugins&nbsp; repository&nbsp; SECURITY.md&nbsp; test&nbsp;&nbsp; version.txt<br />
linlin@linlin-i5:~/.asdf$ git pull<br />
remote: Enumerating objects: 505, done.<br />
remote: Counting objects: 100% (265/265), done.<br />
remote: Compressing objects: 100% (87/87), done.<br />
remote: Total 505 (delta 202), reused 222 (delta 176), pack-reused 240<br />
Receiving objects: 100% (505/505), 494.76 KiB | 37.00 KiB/s, done.<br />
Resolving deltas: 100% (296/296), completed with 61 local objects.<br />
From https://github.com/asdf-vm/asdf<br />
&nbsp;* [new branch]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dependabot/npm_and_yarn/docs/vue/component-compiler-utils-3.3.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt; origin/dependabot/npm_and_yarn/docs/vue/component-compiler-utils-3.3.0<br />
&nbsp;* [new branch]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dependabot/npm_and_yarn/docs/vuepress-vite-2.0.0-beta.45&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt; origin/dependabot/npm_and_yarn/docs/vuepress-vite-2.0.0-beta.45<br />
&nbsp;* [new branch]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dependabot/npm_and_yarn/docs/vuepress/plugin-back-to-top-2.0.0-beta.48 -&gt; origin/dependabot/npm_and_yarn/docs/vuepress/plugin-back-to-top-2.0.0-beta.48<br />
&nbsp;* [new branch]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dependabot/npm_and_yarn/docs/vuepress/plugin-search-2.0.0-beta.48&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt; origin/dependabot/npm_and_yarn/docs/vuepress/plugin-search-2.0.0-beta.48<br />
&nbsp;* [new branch]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dependabot/npm_and_yarn/docs/vuepress/plugin-shiki-2.0.0-beta.48&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt; origin/dependabot/npm_and_yarn/docs/vuepress/plugin-shiki-2.0.0-beta.48<br />
&nbsp;* [new branch]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; docs/bump-site-generator-version&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt; origin/docs/bump-site-generator-version<br />
&nbsp;+ 0505834...9689352 gh-pages&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt; origin/gh-pages&nbsp; (forced update)<br />
&nbsp;&nbsp; 7493f40..a953095&nbsp; master&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt; origin/master<br />
&nbsp;* [new branch]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; release-v0.11.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt; origin/release-v0.11.0<br />
&nbsp;+ 8a6a0c9...1c8648d tb/no-unset-vars&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt; origin/tb/no-unset-vars&nbsp; (forced update)<br />
&nbsp;* [new branch]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt; origin/tmp<br />
&nbsp;* [new tag]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; v0.10.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt; v0.10.0<br />
&nbsp;* [new tag]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; v0.10.1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt; v0.10.1<br />
&nbsp;* [new tag]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; v0.10.2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt; v0.10.2<br />
You are not currently on a branch.<br />
Please specify which branch you want to merge with.<br />
See git-pull(1) for details.</p>

<p>&nbsp;&nbsp;&nbsp; git pull &lt;remote&gt; &lt;branch&gt;</p>

<p>linlin@linlin-i5:~/.asdf$ ls<br />
asdf.elv&nbsp;&nbsp; asdf.sh&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; completions&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; defaults&nbsp; downloads&nbsp; installs&nbsp; LICENSE&nbsp; README.md&nbsp;&nbsp; scripts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; shims&nbsp; tmp<br />
asdf.fish&nbsp; ballad-of-asdf.md&nbsp; CHANGELOG.md&nbsp; CONTRIBUTING.md&nbsp; docs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; help.txt&nbsp;&nbsp; lib&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; plugins&nbsp; repository&nbsp; SECURITY.md&nbsp; test&nbsp;&nbsp; version.txt<br />
linlin@linlin-i5:~/.asdf$ cd plugins/<br />
linlin@linlin-i5:~/.asdf/plugins$ ls<br />
mongodb&nbsp; nodejs&nbsp; postgres&nbsp; redis&nbsp; ruby<br />
linlin@linlin-i5:~/.asdf/plugins$ cd ^C<br />
linlin@linlin-i5:~/.asdf/plugins$ rm mongodb/ -rf<br />
linlin@linlin-i5:~/.asdf/plugins$ asdf plugin-add mongodb https://github.com/sylph01/asdf-mongodb.git<br />
(reverse-i-search)`mong&#39;: asdf plugin-add mongodb https://github.com/sylph01/asdf-^Cngodb.git<br />
linlin@linlin-i5:~/.asdf/plugins$ asdf install mongodb 5.0.6<br />
download_url https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-5.0.6.tgz<br />
&nbsp; % Total&nbsp;&nbsp;&nbsp; % Received % Xferd&nbsp; Average Speed&nbsp;&nbsp; Time&nbsp;&nbsp;&nbsp; Time&nbsp;&nbsp;&nbsp;&nbsp; Time&nbsp; Current<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Dload&nbsp; Upload&nbsp;&nbsp; Total&nbsp;&nbsp; Spent&nbsp;&nbsp;&nbsp; Left&nbsp; Speed<br />
100&nbsp;&nbsp; 243&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp; 243&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp; 191&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 --:--:--&nbsp; 0:00:01 --:--:--&nbsp;&nbsp; 191</p>

<p>gzip: stdin: not in gzip format<br />
tar: Child returned status 1<br />
tar: Error is not recoverable: exiting now<br />
linlin@linlin-i5:~/.asdf/plugins$ docker pull mongo:5.0.6<br />
^C<br />
linlin@linlin-i5:~/.asdf/plugins$ ^C<br />
linlin@linlin-i5:~/.asdf/plugins$ sudo docker pull mongo:5.0.6<br />
[sudo] password for linlin:<br />
5.0.6: Pulling from library/mongo<br />
Digest: sha256:fed6248ae0bb0d54c0448eb786c87120737eedc522172ee1536ad47789782348<br />
Status: Image is up to date for mongo:5.0.6<br />
docker.io/library/mongo:5.0.6</p>

<p>&nbsp;</p>

