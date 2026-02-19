---
title: "Workshops and Tutorials"
subtitle: my workshops and tutorials
permalink: /tutorials/
featured_image: /images/linocut_teaching2.jpg
---

## Workshops and Tutorials

{% for tutorial in site.data.tutorialslist %}

{% if tutorial.current == true %}


  <div class="well-paper publication-entry" style = "background-color: #ffffff">
  <ul class="flex-container">
  <li class="flex-item1">
    {% if tutorial.image %}
     <img src="{{ site.url }}{{ site.baseurl }}/images/tutorials/{{ tutorial.image }}" class="img-responsive"/>
    {% endif %}
  </li>
  <li class="flex-item2">
    <strong> {{ tutorial.title }}</strong><br/>
    {{ tutorial.display }}<br/>
    Given next time in {{ tutorial.semester}}<br/>
    {% if tutorial.abstract %} <a data-bs-toggle="collapse" href="#{{tutorial.url}}"  class="btn-abstract" style="text-decoration:none; color:#ebebeb; hover:#ebebeb;" role="button" aria-expanded="false" aria-controls="{{tutorial.url}}">TUTORIAL INFO</a> {% endif %}
    {% if tutorial.tutorialweb %}<a href="{{ tutorial.tutorialweb }}" target="_blank"><button class="btn-doi">WEB PAGE</button></a> {% endif %}
    {% if tutorial.gitrepo %}<a href="{{ tutorial.gitrepo }}" target="_blank"><button class="btn-arxiv">GIT REPO</button></a> {% endif %}
    {% if tutorial.code %}<a href="{{ tutorial.code }}" target="_blank"><button class="btn-code">CODE</button></a> {% endif %}
    {% if tutorial.suppmat %}<a href="{{ tutorial.suppmat }}" target="_blank"><button class="btn-code">TUTORIAL MATERIAL</button></a> {% endif %}


  {% if tutorial.abstract %}
  <div class="collapse" id="{{tutorial.url}}"><div class="well-abstract">
   {{tutorial.abstract}}
  </div></div>
  {% endif %}

  </li>
  </ul>
  </div>

  {% endif %}
  
{% endfor %}

