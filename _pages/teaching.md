---
title: "Teaching"
subtitle: my courses
permalink: /teaching/
featured_image: /images/linocut_teaching2.jpg
---

## Interactive notebooks

I have created a number of [interactive notebooks](interactive) for teaching. The notebooks are written in JavaScript on the [Observable](https://observablehq.com/) platform and can be run in the browser without any installation.

## Current courses

{% for course in site.data.courselist %}

{% if course.current == true %}


  <div class="well-paper publication-entry" style = "background-color: #ffffff">
  <ul class="flex-container">
  <li class="flex-item1">
    {% if course.image %}
     <img src="{{ site.url }}{{ site.baseurl }}/images/courses/{{ course.image }}" class="img-responsive"/>
    {% endif %}
  </li>
  <li class="flex-item2">
    <strong> {{ course.title }}</strong><br/>
    {{ course.display }}<br/>
    Given next time in {{ course.semester}}<br/>
    {% if course.abstract %} <a data-bs-toggle="collapse" href="#{{course.url}}"  class="btn-abstract" style="text-decoration:none; color:#ebebeb; hover:#ebebeb;" role="button" aria-expanded="false" aria-controls="{{course.url}}">COURSE INFO</a> {% endif %}
    {% if course.courseweb %}<a href="{{ course.courseweb }}" target="_blank"><button class="btn-doi">WEB PAGE</button></a> {% endif %}
    {% if course.gitrepo %}<a href="{{ course.gitrepo }}" target="_blank"><button class="btn-arxiv">GIT REPO</button></a> {% endif %}
    {% if course.code %}<a href="{{ course.code }}" target="_blank"><button class="btn-code">CODE</button></a> {% endif %}
    {% if course.suppmat %}<a href="{{ course.suppmat }}" target="_blank"><button class="btn-code">COURSE MATERIAL</button></a> {% endif %}


  {% if course.abstract %}
  <div class="collapse" id="{{course.url}}"><div class="well-abstract">
   {{course.abstract}}
  </div></div>
  {% endif %}

  </li>
  </ul>
  </div>

  {% endif %}
  
{% endfor %}

## Past Courses

{% for course in site.data.courselist %}

{% if course.current == false %}


  <div class="well-paper publication-entry" style = "background-color: #ffffff">
  <ul class="flex-container">
  <li class="flex-item1">
    {% if course.image %}
     <img src="{{ site.url }}{{ site.baseurl }}/images/courses/{{ course.image }}" class="img-responsive"/>
    {% endif %}
  </li>
  <li class="flex-item2">
    <strong> {{ course.title }}</strong><br/>
    {{ course.display }}<br/>
    {{ course.semester}}<br/>
    {% if course.abstract %} <a data-bs-toggle="collapse" href="#{{course.url}}"  class="btn-abstract" style="text-decoration:none; color:#ebebeb; hover:#ebebeb;" role="button" aria-expanded="false" aria-controls="{{course.url}}">COURSE INFO</a> {% endif %}
    {% if course.courseweb %}<a href="{{ course.courseweb }}" target="_blank"><button class="btn-doi">WEB PAGE</button></a> {% endif %}
    {% if course.gitrepo %}<a href="{{ course.gitrepo }}" target="_blank"><button class="btn-arxiv">GIT REPO</button></a> {% endif %}
    {% if course.code %}<a href="{{ course.code }}" target="_blank"><button class="btn-code">CODE</button></a> {% endif %}
    {% if course.suppmat %}<a href="{{ course.suppmat }}" target="_blank"><button class="btn-code">COURSE MATERIAL</button></a> {% endif %}


  {% if course.abstract %}
  <div class="collapse" id="{{course.url}}"><div class="well-abstract">
   {{course.abstract}}
  </div></div>
  {% endif %}

  </li>
  </ul>
  </div>

  {% endif %}
  
{% endfor %}