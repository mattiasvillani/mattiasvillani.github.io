---
title: Students
subtitle: my academic family
description: My students.
featured_image: /images/HermanMattiasCrop.jpg
---

## Genealogy

The [Mathematics Genealogy project](https://www.genealogy.math.ndsu.nodak.edu/id.php?id=104187) keeps tracks of mathematicians in the world. \\
Here is part of my academic family tree: 

<img src="/images/VillaniGenealogy.png" alt="Geneaology">


## Current PhD students - main supervisor

{% for student in site.data.studentlist %}

{% if student.current == true %}


  <div class="well-paper publication-entry" style = "background-color: #ffffff">
  <ul class="flex-container">
  <li class="flex-item1">
    {% if student.image %}
     <img src="{{ site.url }}{{ site.baseurl }}/images/students/{{ student.image }}" class="img-responsive"/>
    {% endif %}
  </li>
  <li class="flex-item2">
    <strong> {{ student.name }}</strong><br/>
    {{ student.phddate }}<br/>
    <small>
    Topic: {{ student.topic }}<br/>
    {% if student.award %}
        {{ student.award }}<br/>
    {% endif %}
    Position: {{ student.position }}<br/>
    </small>
    {% if student.web %}<a href="{{ student.web }}" target="_blank"><button class="btn-doi">WEB PAGE</button></a> {% endif %}

  </li>
  </ul>
  </div>

  {% endif %}
  
{% endfor %}

## Graduated PhD students - main supervisor

{% for student in site.data.studentlist %}

{% if student.current == false %}


  <div class="well-paper publication-entry" style = "background-color: #ffffff">
  <ul class="flex-container">
  <li class="flex-item1">
    {% if student.image %}
     <img src="{{ site.url }}{{ site.baseurl }}/images/students/{{ student.image }}" class="img-responsive"/>
    {% endif %}
  </li>
  <li class="flex-item2">
    <strong> {{ student.name }}</strong><br/>
    {{ student.phddate }}<br/>
    <small>
    Thesis: {{ student.thesis }}<br/>
    {% if student.award %}
        {{ student.award }}<br/>
    {% endif %}
    Position: {{ student.position }}<br/>
    </small>
    {% if student.web %}<a href="{{ student.web }}" target="_blank"><button class="btn-doi">WEB PAGE</button></a> {% endif %}

  </li>
  </ul>
  </div>

  {% endif %}
  
{% endfor %}


## Current post docs

{% for student in site.data.postdoclist %}

{% if student.current == true %}

  <div class="well-paper publication-entry" style = "background-color: #ffffff">
  <ul class="flex-container">
  <li class="flex-item1">
    {% if student.image %}
     <img src="{{ site.url }}{{ site.baseurl }}/images/students/{{ student.image }}" class="img-responsive"/>
    {% endif %}
  </li>
  <li class="flex-item2">
    <strong> {{ student.name }}</strong><br/>
    {{ student.topic }}<br/>
    <small>
    {% if student.award %}
        {{ student.award }}<br/>
    {% endif %}
    Position: {{ student.position }}<br/>
    </small>
    {% if student.web %}<a href="{{ student.web }}" target="_blank"><button class="btn-doi">WEB PAGE</button></a> {% endif %}

  </li>
  </ul>
  </div>

    {% endif %}
  
{% endfor %}

## Previous post docs

{% for student in site.data.postdoclist %}

{% if student.current == false %}

  <div class="well-paper publication-entry" style = "background-color: #ffffff">
  <ul class="flex-container">
  <li class="flex-item1">
    {% if student.image %}
     <img src="{{ site.url }}{{ site.baseurl }}/images/students/{{ student.image }}" class="img-responsive"/>
    {% endif %}
  </li>
  <li class="flex-item2">
    <strong> {{ student.name }}</strong><br/>
    {{ student.topic }}<br/>
    <small>
    {% if student.award %}
        {{ student.award }}<br/>
    {% endif %}
    Position: {{ student.position }}<br/>
    </small>
    {% if student.web %}<a href="{{ student.web }}" target="_blank"><button class="btn-doi">WEB PAGE</button></a> {% endif %}

  </li>
  </ul>
  </div>

    {% endif %}
  
{% endfor %}