---
layout: page
title: "Research"
subtitle: my publications
permalink: /research/
featured_image: /images/prof_research.png
---

The image for each paper is an AI-generated modification of an original image in the paper.

{% assign yeartest = true %}
{% for publi in site.data.publist %}
  {% if publi.year %}{% else %}
   {% assign yeartest = false %}
  {% endif %}
{% endfor %}


{% if yeartest == false %}
## arXived
{% endif %}

{% for publi in site.data.publist %}

  
  {% assign pdfpresent = false %}
  {% if publi.url %}
    {% assign pdffile = "/papers/" | append:  publi.url  | append: ".pdf" %}
    {% for file in site.static_files %}
      {% if file.path contains pdffile %}
       {% assign pdfpresent = true %}
      {% endif %}
    {% endfor %}
  {% endif %}

  {% if publi.year %}{% else %}

  {% assign bibtest = false %}
  {% if publi.url %}
    {% assign bibfile = "/papers/" | append:  publi.url  | append: ".txt" %}
    {% for file in site.static_files %}
      {% if file.path contains bibfile %}
       {% assign bibtest = true %}
      {% endif %}
    {% endfor %}
  {% endif %}

<!--  
  <div class="well-sm publication-entry" style = "background-color: #F8F8F8; border = 1px; border-color: #F6F6F6; box-shadow: 3px 3px #F1F1F1;">
-->
  <div class="well-paper publication-entry" style = "background-color: #ffffff">
  <ul class="flex-container">
  <li class="flex-item1">
    {% if publi.image %}
     <img src="{{ site.url }}{{ site.baseurl }}/images/publications/{{ publi.image }}" class="img-responsive"/>
    {% endif %}
  </li>
  <li class="flex-item2">
    <strong> {{ publi.title }}</strong><br/>
    with {{ publi.authors }}<br/>
    {{ publi.display }}<br/>
    {% if publi.abstract %} <a data-bs-toggle="collapse" href="#{{publi.url}}"  class="btn-abstract" style="text-decoration:none; color:#ebebeb; hover:#ebebeb;" role="button" aria-expanded="false" aria-controls="{{publi.url}}">ABSTRACT</a> {% endif %}
    {% if bibtest == true %} <a data-bs-toggle="collapse" href="#{{publi.url}}2"  class="btn-bib" style="text-decoration:none; color:#ebebeb; hover:#ebebeb;" role="button" aria-expanded="false" aria-controls="{{publi.url}}2">BIB</a> {% endif %}
    {% if pdfpresent == true %}<a href="{{ pdffile }}" target="_blank"><button class="btn-pdf">PDF</button></a>{% endif %}
    {% if publi.doi %}<a href="http://doi.org/{{ publi.doi }}" target="_blank"><button class="btn-doi">JOURNAL</button></a> {% endif %}
    {% if publi.arxiv %}<a href="https://arxiv.org/abs/{{ publi.arxiv | format('f') }}" target="_blank"><button class="btn-arxiv">ARXIV</button></a> {% endif %}
    {% if publi.suppmat %}<a href="{{ publi.suppmat }}" target="_blank"><button class="btn-suppmat">SUPPLEMENTARY MATERIAL</button></a> {% endif %}
    {% if publi.code %}<a href="{{ publi.code }}" target="_blank"><button class="btn-code">CODE</button></a> {% endif %}


  {% if publi.abstract %}
  <div class="collapse" id="{{publi.url}}"><div class="well-abstract">
   {{publi.abstract}}
  </div></div>
  {% endif %}

  {% if bibtest == true %}
  <div class="collapse" id="{{publi.url}}2"><div class="well-bib">
   <iframe src='{{site.url}}{{site.baseurl}}/papers/{{publi.url}}.txt' scrolling='yes' width="100%" height="210" frameborder='0'></iframe>
  </div></div>
  {% endif %}

  </li>
  </ul>
  </div>

  {% endif %}
{% endfor %}

{% if site.group_pub_by_year == true %}{% else %}
## Journal Articles
{% endif %}

{% for myyear in site.data.years %}

{% assign yeartest = false %}
{% for publi in site.data.publist %}
  {% if publi.year == myyear.year %}
   {% assign yeartest = true %}
  {% endif %}
{% endfor %}

{% if site.group_pub_by_year == true %}
{% if yeartest == true %}
## {{ myyear.year }}
{% endif %}
{% endif %}

{% for publi in site.data.publist %}

{% if publi.journal == true %}

{% assign pdfpresent = false %}
  {% if publi.url %}
    {% assign pdffile = "/papers/" | append:  publi.url  | append: ".pdf" %}
    {% for file in site.static_files %}
      {% if file.path contains pdffile %}
       {% assign pdfpresent = true %}
      {% endif %}
    {% endfor %}
  {% endif %}

{% if publi.year == myyear.year %}


{% assign bibtest = false %}
{% if publi.url %}
{% assign bibfile = "/papers/" | append:  publi.url  | append: ".txt" %}
{% for file in site.static_files %}
  {% if file.path contains bibfile %}
   {% assign bibtest = true %}
  {% endif %}
{% endfor %}
{% endif %}

<div class="well-paper publication-entry" style = "background-color: #ffffff">
<ul class="flex-container">
<li class="flex-item1">
  {% if publi.image %}
     <img src="{{ site.url }}{{ site.baseurl }}/images/publications/{{ publi.image }}" class="img-responsive"/>
  {% endif %}
</li>
<li class="flex-item2">
  <strong> {{ publi.title }}</strong> <br />
  with {{ publi.authors }} <br />
  <em>{{ publi.display }}</em> {% if publi.year %}<em>({{publi.year}})</em>{% endif %}<br/>
  {% if publi.abstract %} <a data-bs-toggle="collapse" href="#{{publi.url}}"  class="btn-abstract" style="text-decoration:none; color:#ebebeb; hover:#ebebeb;" role="button" aria-expanded="false" aria-controls="{{publi.url}}">ABSTRACT</a> {% endif %}
  {% if bibtest == true %} <a data-bs-toggle="collapse" href="#{{publi.url}}2"  class="btn-bib" style="text-decoration:none; color:#ebebeb; hover:#ebebeb;" role="button" aria-expanded="false" aria-controls="{{publi.url}}2">BIB</a> {% endif %}
  {% if pdfpresent == true %}<a href="{{ pdffile }}" target="_blank"><button class="btn-pdf">PDF</button></a>{% endif %}
  {% if publi.doi %}<a href="http://doi.org/{{ publi.doi }}" target="_blank"><button class="btn-doi">JOURNAL</button></a> {% endif %}
  {% if publi.arxiv %}<a href="https://arxiv.org/abs/{{ publi.arxiv | format('f') }}" target="_blank"><button class="btn-arxiv">ARXIV</button></a> {% endif %}
  {% if publi.suppmat %}<a href="{{ publi.suppmat }}" target="_blank"><button class="btn-suppmat">SUPPLEMENTARY MATERIAL</button></a> {% endif %}
  {% if publi.code %}<a href="{{ publi.code }}" target="_blank"><button class="btn-code">CODE</button></a> {% endif %}

{% if publi.abstract %}
<br/>
<div class="collapse" id="{{publi.url}}"><div class="well-abstract">
 {{publi.abstract}}
</div></div>
{% endif %}

{% if bibtest == true %}
<div class="collapse" id="{{publi.url}}2"><div class="well-bib">
<iframe src='{{site.url}}{{site.baseurl}}/papers/{{publi.url}}.txt' scrolling='yes' width="100%" height="210" frameborder='0'></iframe>
</div></div>
{% endif %}

</li>
</ul>

</div>
{% endif %}
{% endif %}
{% endfor %}

{% endfor %}





## Refereed Conference Proceedings

{% for myyear in site.data.years %}

{% assign yeartest = false %}
{% for publi in site.data.publist %}
  {% if publi.year == myyear.year %}
   {% assign yeartest = true %}
  {% endif %}
{% endfor %}

{% if site.group_pub_by_year == true %}
{% if yeartest == true %}
## {{ myyear.year }}
{% endif %}
{% endif %}

{% for publi in site.data.publist %}

{% if publi.conference %}

{% assign pdfpresent = false %}
  {% if publi.url %}
    {% assign pdffile = "/papers/" | append:  publi.url  | append: ".pdf" %}
    {% for file in site.static_files %}
      {% if file.path contains pdffile %}
       {% assign pdfpresent = true %}
      {% endif %}
    {% endfor %}
  {% endif %}

{% if publi.year == myyear.year %}


{% assign bibtest = false %}
{% if publi.url %}
{% assign bibfile = "/papers/" | append:  publi.url  | append: ".txt" %}
{% for file in site.static_files %}
  {% if file.path contains bibfile %}
   {% assign bibtest = true %}
  {% endif %}
{% endfor %}
{% endif %}

<div class="well-paper publication-entry" style = "background-color: #ffffff">
<ul class="flex-container">
<li class="flex-item1">
  {% if publi.image %}
     <img src="{{ site.url }}{{ site.baseurl }}/images/publications/{{ publi.image }}" class="img-responsive"/>
  {% endif %}
</li>
<li class="flex-item2">
  <strong> {{ publi.title }}</strong> <br />
  with {{ publi.authors }} <br />
  <em>{{ publi.display }}</em> {% if publi.year %}<em>({{publi.year}})</em>{% endif %}<br/>
  {% if publi.abstract %} <a data-bs-toggle="collapse" href="#{{publi.url}}"  class="btn-abstract" style="text-decoration:none; color:#ebebeb; hover:#ebebeb;" role="button" aria-expanded="false" aria-controls="{{publi.url}}">ABSTRACT</a> {% endif %}
  {% if bibtest == true %} <a data-bs-toggle="collapse" href="#{{publi.url}}2"  class="btn-bib" style="text-decoration:none; color:#ebebeb; hover:#ebebeb;" role="button" aria-expanded="false" aria-controls="{{publi.url}}2">BIB</a> {% endif %}
  {% if pdfpresent == true %}<a href="{{ pdffile }}" target="_blank"><button class="btn-pdf">PDF</button></a>{% endif %}
  {% if publi.doi %}<a href="http://doi.org/{{ publi.doi }}" target="_blank"><button class="btn-doi">PROCEEDINGS</button></a> {% endif %}
  {% if publi.arxiv %}<a href="https://arxiv.org/abs/{{ publi.arxiv | format('f') }}" target="_blank"><button class="btn-arxiv">ARXIV</button></a> {% endif %}
  {% if publi.suppmat %}<a href="{{ publi.suppmat }}" target="_blank"><button class="btn-suppmat">SUPPLEMENTARY MATERIAL</button></a> {% endif %}
  {% if publi.code %}<a href="{{ publi.code }}" target="_blank"><button class="btn-code">CODE</button></a> {% endif %}

{% if publi.abstract %}
<br/>
<div class="collapse" id="{{publi.url}}"><div class="well-abstract">
 {{publi.abstract}}
</div></div>
{% endif %}

{% if bibtest == true %}
<div class="collapse" id="{{publi.url}}2"><div class="well-bib">
<iframe src='{{site.url}}{{site.baseurl}}/papers/{{publi.url}}.txt' scrolling='yes' width="100%" height="210" frameborder='0'></iframe>
</div></div>
{% endif %}

</li>
</ul>

</div>
{% endif %}
{% endif %}


{% endfor %}
 
{% endfor %}








## Book Chapters

{% for myyear in site.data.years %}

{% assign yeartest = false %}
{% for publi in site.data.publist %}
  {% if publi.year == myyear.year %}
   {% assign yeartest = true %}
  {% endif %}
{% endfor %}

{% if site.group_pub_by_year == true %}
{% if yeartest == true %}
## {{ myyear.year }}
{% endif %}
{% endif %}

{% for publi in site.data.publist %}

{% if publi.bookchapter %}

{% assign pdfpresent = false %}
  {% if publi.url %}
    {% assign pdffile = "/papers/" | append:  publi.url  | append: ".pdf" %}
    {% for file in site.static_files %}
      {% if file.path contains pdffile %}
       {% assign pdfpresent = true %}
      {% endif %}
    {% endfor %}
  {% endif %}

{% if publi.year == myyear.year %}


{% assign bibtest = false %}
{% if publi.url %}
{% assign bibfile = "/papers/" | append:  publi.url  | append: ".txt" %}
{% for file in site.static_files %}
  {% if file.path contains bibfile %}
   {% assign bibtest = true %}
  {% endif %}
{% endfor %}
{% endif %}

<div class="well-paper publication-entry" style = "background-color: #ffffff">
<ul class="flex-container">
<li class="flex-item1">
  {% if publi.image %}
     <img src="{{ site.url }}{{ site.baseurl }}/images/publications/{{ publi.image }}" class="img-responsive"/>
  {% endif %}
</li>
<li class="flex-item2">
  <strong> {{ publi.title }}</strong> <br />
  with {{ publi.authors }} <br />
  <em>{{ publi.display }}</em> {% if publi.year %}<em>({{publi.year}})</em>{% endif %}<br/>
  {% if publi.abstract %} <a data-bs-toggle="collapse" href="#{{publi.url}}"  class="btn-abstract" style="text-decoration:none; color:#ebebeb; hover:#ebebeb;" role="button" aria-expanded="false" aria-controls="{{publi.url}}">ABSTRACT</a> {% endif %}
  {% if bibtest == true %} <a data-bs-toggle="collapse" href="#{{publi.url}}2"  class="btn-bib" style="text-decoration:none; color:#ebebeb; hover:#ebebeb;" role="button" aria-expanded="false" aria-controls="{{publi.url}}2">BIB</a> {% endif %}
  {% if pdfpresent == true %}<a href="{{ pdffile }}" target="_blank"><button class="btn-pdf">PDF</button></a>{% endif %}
  {% if publi.doi %}<a href="http://doi.org/{{ publi.doi }}" target="_blank"><button class="btn-doi">BOOK CHAPTER</button></a> {% endif %}
  {% if publi.arxiv %}<a href="https://arxiv.org/abs/{{ publi.arxiv | format('f') }}" target="_blank"><button class="btn-arxiv">ARXIV</button></a> {% endif %}
  {% if publi.suppmat %}<a href="{{ publi.suppmat }}" target="_blank"><button class="btn-suppmat">SUPPLEMENTARY MATERIAL</button></a> {% endif %}
  {% if publi.code %}<a href="{{ publi.code }}" target="_blank"><button class="btn-code">CODE</button></a> {% endif %}

{% if publi.abstract %}
<br/>
<div class="collapse" id="{{publi.url}}"><div class="well-abstract">
 {{publi.abstract}}
</div></div>
{% endif %}

{% if bibtest == true %}
<div class="collapse" id="{{publi.url}}2"><div class="well-bib">
<iframe src='{{site.url}}{{site.baseurl}}/papers/{{publi.url}}.txt' scrolling='yes' width="100%" height="210" frameborder='0'></iframe>
</div></div>
{% endif %}

</li>
</ul>

</div>
{% endif %}
{% endif %}


{% endfor %}
 
{% endfor %}

## Books

{% for myyear in site.data.years %}

{% assign yeartest = false %}
{% for publi in site.data.publist %}
  {% if publi.year == myyear.year %}
   {% assign yeartest = true %}
  {% endif %}
{% endfor %}

{% if site.group_pub_by_year == true %}
{% if yeartest == true %}
## {{ myyear.year }}
{% endif %}
{% endif %}

{% for publi in site.data.publist %}

{% if publi.book %}

{% assign pdfpresent = false %}
  {% if publi.url %}
    {% assign pdffile = "/papers/" | append:  publi.url  | append: ".pdf" %}
    {% for file in site.static_files %}
      {% if file.path contains pdffile %}
       {% assign pdfpresent = true %}
      {% endif %}
    {% endfor %}
  {% endif %}

{% if publi.year == myyear.year %}


{% assign bibtest = false %}
{% if publi.url %}
{% assign bibfile = "/papers/" | append:  publi.url  | append: ".txt" %}
{% for file in site.static_files %}
  {% if file.path contains bibfile %}
   {% assign bibtest = true %}
  {% endif %}
{% endfor %}
{% endif %}

<div class="well-paper publication-entry" style = "background-color: #ffffff">
<ul class="flex-container">
<li class="flex-item1">
  {% if publi.image %}
     <img src="{{ site.url }}{{ site.baseurl }}/images/publications/{{ publi.image }}" class="img-responsive"/>
  {% endif %}
</li>
<li class="flex-item2">
  <strong> {{ publi.title }}</strong> <br />
  with {{ publi.authors }} <br />
  <em>{{ publi.display }}</em> {% if publi.year %}<em>({{publi.year}})</em>{% endif %}<br/>
  {% if publi.abstract %} <a data-bs-toggle="collapse" href="#{{publi.url}}"  class="btn-abstract" style="text-decoration:none; color:#ebebeb; hover:#ebebeb;" role="button" aria-expanded="false" aria-controls="{{publi.url}}">ABSTRACT</a> {% endif %}
  {% if bibtest == true %} <a data-bs-toggle="collapse" href="#{{publi.url}}2"  class="btn-bib" style="text-decoration:none; color:#ebebeb; hover:#ebebeb;" role="button" aria-expanded="false" aria-controls="{{publi.url}}2">BIB</a> {% endif %}
  {% if pdfpresent == true %}<a href="{{ pdffile }}" target="_blank"><button class="btn-pdf">PDF</button></a>{% endif %}
  {% if publi.doi %}<a href="http://doi.org/{{ publi.doi }}" target="_blank"><button class="btn-doi">BOOK WEBSITE</button></a> {% endif %}
  {% if publi.arxiv %}<a href="https://arxiv.org/abs/{{ publi.arxiv | format('f') }}" target="_blank"><button class="btn-arxiv">ARXIV</button></a> {% endif %}
  {% if publi.suppmat %}<a href="{{ publi.suppmat }}" target="_blank"><button class="btn-suppmat">SUPPLEMENTARY MATERIAL</button></a> {% endif %}
  {% if publi.code %}<a href="{{ publi.code }}" target="_blank"><button class="btn-code">CODE</button></a> {% endif %}

{% if publi.abstract %}
<br/>
<div class="collapse" id="{{publi.url}}"><div class="well-abstract">
 {{publi.abstract}}
</div></div>
{% endif %}

{% if bibtest == true %}
<div class="collapse" id="{{publi.url}}2"><div class="well-bib">
<iframe src='{{site.url}}{{site.baseurl}}/papers/{{publi.url}}.txt' scrolling='yes' width="100%" height="210" frameborder='0'></iframe>
</div></div>
{% endif %}

</li>
</ul>

</div>
{% endif %}
{% endif %}


{% endfor %}
 
{% endfor %}



## Other publications

{% for myyear in site.data.years %}

{% assign yeartest = false %}
{% for publi in site.data.publist %}
  {% if publi.year == myyear.year %}
   {% assign yeartest = true %}
  {% endif %}
{% endfor %}

{% if site.group_pub_by_year == true %}
{% if yeartest == true %}
## {{ myyear.year }}
{% endif %}
{% endif %}

{% for publi in site.data.publist %}

{% if publi.other %}

{% assign pdfpresent = false %}
  {% if publi.url %}
    {% assign pdffile = "/papers/" | append:  publi.url  | append: ".pdf" %}
    {% for file in site.static_files %}
      {% if file.path contains pdffile %}
       {% assign pdfpresent = true %}
      {% endif %}
    {% endfor %}
  {% endif %}

{% if publi.year == myyear.year %}


{% assign bibtest = false %}
{% if publi.url %}
{% assign bibfile = "/papers/" | append:  publi.url  | append: ".txt" %}
{% for file in site.static_files %}
  {% if file.path contains bibfile %}
   {% assign bibtest = true %}
  {% endif %}
{% endfor %}
{% endif %}

<div class="well-paper publication-entry" style = "background-color: #ffffff">
<ul class="flex-container">
<li class="flex-item1">
  {% if publi.image %}
     <img src="{{ site.url }}{{ site.baseurl }}/images/publications/{{ publi.image }}" class="img-responsive"/>
  {% endif %}
</li>
<li class="flex-item2">
  <strong> {{ publi.title }}</strong> <br />
  with {{ publi.authors }} <br />
  <em>{{ publi.display }}</em> {% if publi.year %}<em>({{publi.year}})</em>{% endif %}<br/>
  {% if publi.abstract %} <a data-bs-toggle="collapse" href="#{{publi.url}}"  class="btn-abstract" style="text-decoration:none; color:#ebebeb; hover:#ebebeb;" role="button" aria-expanded="false" aria-controls="{{publi.url}}">ABSTRACT</a> {% endif %}
  {% if bibtest == true %} <a data-bs-toggle="collapse" href="#{{publi.url}}2"  class="btn-bib" style="text-decoration:none; color:#ebebeb; hover:#ebebeb;" role="button" aria-expanded="false" aria-controls="{{publi.url}}2">BIB</a> {% endif %}
  {% if pdfpresent == true %}<a href="{{ pdffile }}" target="_blank"><button class="btn-pdf">PDF</button></a>{% endif %}
  {% if publi.doi %}<a href="http://doi.org/{{ publi.doi }}" target="_blank"><button class="btn-doi">JOURNAL</button></a> {% endif %}
  {% if publi.arxiv %}<a href="https://arxiv.org/abs/{{ publi.arxiv | format('f') }}" target="_blank"><button class="btn-arxiv">ARXIV</button></a> {% endif %}
  {% if publi.suppmat %}<a href="{{ publi.suppmat }}" target="_blank"><button class="btn-suppmat">SUPPLEMENTARY MATERIAL</button></a> {% endif %}
  {% if publi.code %}<a href="{{ publi.code }}" target="_blank"><button class="btn-code">CODE</button></a> {% endif %}

{% if publi.abstract %}
<br/>
<div class="collapse" id="{{publi.url}}"><div class="well-abstract">
 {{publi.abstract}}
</div></div>
{% endif %}

{% if bibtest == true %}
<div class="collapse" id="{{publi.url}}2"><div class="well-bib">
<iframe src='{{site.url}}{{site.baseurl}}/papers/{{publi.url}}.txt' scrolling='yes' width="100%" height="210" frameborder='0'></iframe>
</div></div>
{% endif %}

</li>
</ul>

</div>
{% endif %}
{% endif %}


{% endfor %}
 
{% endfor %}







## Older working papers

{% for myyear in site.data.years %}

{% assign yeartest = false %}
{% for publi in site.data.publist %}
  {% if publi.year == myyear.year %}
   {% assign yeartest = true %}
  {% endif %}
{% endfor %}

{% if site.group_pub_by_year == true %}
{% if yeartest == true %}
## {{ myyear.year }}
{% endif %}
{% endif %}

{% for publi in site.data.publist %}

{% if publi.wp == true %}

{% assign pdfpresent = false %}
  {% if publi.url %}
    {% assign pdffile = "/papers/" | append:  publi.url  | append: ".pdf" %}
    {% for file in site.static_files %}
      {% if file.path contains pdffile %}
       {% assign pdfpresent = true %}
      {% endif %}
    {% endfor %}
  {% endif %}

{% if publi.year == myyear.year %}


{% assign bibtest = false %}
{% if publi.url %}
{% assign bibfile = "/papers/" | append:  publi.url  | append: ".txt" %}
{% for file in site.static_files %}
  {% if file.path contains bibfile %}
   {% assign bibtest = true %}
  {% endif %}
{% endfor %}
{% endif %}

<div class="well-paper publication-entry" style = "background-color: #ffffff">
<ul class="flex-container">
<li class="flex-item1">
  {% if publi.image %}
     <img src="{{ site.url }}{{ site.baseurl }}/images/publications/{{ publi.image }}" class="img-responsive"/>
  {% endif %}
</li>
<li class="flex-item2">
  <strong> {{ publi.title }}</strong> <br />
  with {{ publi.authors }} <br />
  <em>{{ publi.display }}</em> {% if publi.year %}<em>({{publi.year}})</em>{% endif %}<br/>
  {% if publi.abstract %} <a data-bs-toggle="collapse" href="#{{publi.url}}"  class="btn-abstract" style="text-decoration:none; color:#ebebeb; hover:#ebebeb;" role="button" aria-expanded="false" aria-controls="{{publi.url}}">ABSTRACT</a> {% endif %}
  {% if bibtest == true %} <a data-bs-toggle="collapse" href="#{{publi.url}}2"  class="btn-bib" style="text-decoration:none; color:#ebebeb; hover:#ebebeb;" role="button" aria-expanded="false" aria-controls="{{publi.url}}2">BIB</a> {% endif %}
  {% if pdfpresent == true %}<a href="{{ pdffile }}" target="_blank"><button class="btn-pdf">PDF</button></a>{% endif %}
  {% if publi.doi %}<a href="http://doi.org/{{ publi.doi }}" target="_blank"><button class="btn-doi">JOURNAL</button></a> {% endif %}
  {% if publi.arxiv %}<a href="https://arxiv.org/abs/{{ publi.arxiv | format('f') }}" target="_blank"><button class="btn-arxiv">ARXIV</button></a> {% endif %}
  {% if publi.suppmat %}<a href="{{ publi.suppmat }}" target="_blank"><button class="btn-suppmat">SUPPLEMENTARY MATERIAL</button></a> {% endif %}
  {% if publi.code %}<a href="{{ publi.code }}" target="_blank"><button class="btn-code">CODE</button></a> {% endif %}

{% if publi.abstract %}
<br/>
<div class="collapse" id="{{publi.url}}"><div class="well-abstract">
 {{publi.abstract}}
</div></div>
{% endif %}

{% if bibtest == true %}
<div class="collapse" id="{{publi.url}}2"><div class="well-bib">
<iframe src='{{site.url}}{{site.baseurl}}/papers/{{publi.url}}.txt' scrolling='yes' width="100%" height="210" frameborder='0'></iframe>
</div></div>
{% endif %}

</li>
</ul>

</div>
{% endif %}
{% endif %}


{% endfor %}
 
{% endfor %}

