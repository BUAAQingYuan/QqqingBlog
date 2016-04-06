<header>
	<h1>{% if page.title %}<a href="http://{{ site.host }}" class="minor">{{ site.name }}</a> / {{ page.title }}{% else %}{{ site.name }}{% endif %}</h1>
	{% if page.title == null %}<p class="additional">{{ site.desc }}</p>{% endif %}
</header>
