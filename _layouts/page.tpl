<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<meta name="author" content="{{ site.meta.author.name }}" />
<meta name="keywords" content="{{ page.tags | join: ',' }}" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>{{ site.name }}{% if page.title %} / {{ page.title }}{% endif %}</title>
<link href="http://{{ site.host }}/feed.xml" rel="alternate" title="{{ site.name }}" type="application/atom+xml" />
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="http://{{ site.host }}/assets/css/site.css" />
<link rel="stylesheet" type="text/css" href="http://{{ site.host }}/assets/css/code/github.css" />
{% for style in page.styles %}<link rel="stylesheet" type="text/css" href="{{ style }}" />
{% endfor %}
</head>

<body class="{{ layout.class }}">

<div class="main">
	{{ content }}

	<footer>
		<p>&copy; Since 2016</p>
	</footer>
</div>

<aside>
	<h2><a href="http://{{ site.host }}">{{ site.name }}</a><a href="http://{{ site.host }}/feed.xml" class="feed-link" title="Subscribe"><i class="fa fa-rss-square"></i></a></h2>
	
	<nav class="block">
		<ul>
		{% for category in site.custom.categories %}<li class="{{ category.name }}"><a href="http://{{ site.host }}/category/{{ category.name }}/">{{ category.title }}</a></li>
		{% endfor %}
		</ul>
	</nav>
	
	<form action="http://{{ site.host }}/search/" class="block block-search">
		<h3>Search</h3>
		<p><input type="search" name="q" placeholder="Search" /></p>
	</form>
	
	<div class="block block-about">
		<h3>About Author</h3>
		<figure>
			{% if site.meta.author.gravatar %}<img src="http://{{ site.host }}/assets/images/{{ site.meta.author.gravatar }}" />{% endif %}
			<figcaption><strong>{{ site.meta.author.name }}</strong></figcaption>
		</figure>
		<p>Hello,Young!</p>
	</div>
	
	<div class="block block-license">
		<h3>Copyright</h3>
		<a href=""></a>
		<p><a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/2.5/cn/" target="_blank" class="hide-target-icon" title="Copyright declaration of site content"><img alt="知识共享许可协议" src="http://{{ site.host }}/assets/images/copyright.png" /></a></p>
	</div>
	
	{% if site.meta.author.github %}
	<div class="block block-fork">
		<a href="https://github.com/{{ site.meta.author.github }}"><img style="position: absolute; top: 0; right: 0; border: 0;" src="https://s3.amazonaws.com/github/ribbons/forkme_right_orange_ff7600.png" alt="Fork me on GitHub"></a>
	</div>
	{% endif %}
	
	<div class="block block-thank">
		<h3>Others</h3>
		<!--待添加-->
		<ul>
			<li><p><a href="https://github.com/{{ site.meta.author.github }}">View my GitHub :)</a></p></li>
			<li><p><a href="http://git.oschina.net/{{ site.meta.author.gitosc }}">View my Git@OSC :)</a></p></li>
		</ul>

	</div>
</aside>

<script src="http://elfjs.qiniudn.com/code/elf-0.5.0.min.js"></script>
<script src="http://yandex.st/highlightjs/7.3/highlight.min.js"></script>

<script src="http://{{ site.host }}/assets/js/site.js"></script>
{% for script in page.scripts %}<script src="{{ script }}"></script>
{% endfor %}
<script>
site.URL_GOOGLE_API = '{{site.meta.gapi}}';
site.URL_DISCUS_COMMENT = '{{ site.meta.author.disqus }}' ? 'http://{{ site.meta.author.disqus }}.{{ site.meta.disqus }}' : '';

site.VAR_SITE_NAME = "{{ site.name | replace:'"','\"' }}";
site.VAR_GOOGLE_CUSTOM_SEARCH_ID = '{{ site.meta.author.gcse }}';
site.TPL_SEARCH_TITLE = '#{0} / 搜索：#{1}';
site.VAR_AUTO_LOAD_ON_SCROLL = {{ site.custom.scrollingLoadCount }};
</script>
</body>
</html>