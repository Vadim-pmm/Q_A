# Ruby, Rails, JQuery Q&A app

An app which encourages you to answer some questions related to Ruby, Rails and JQuery.
No ratings; session will last 20 minutes.

The results can be send by email in pdf format.
You can add your own question to the database by pressing the button <strong>Import</strong> and loading a file. A file should contain one array of jsons like :

[

{"question":" &lt;p&gt;... some question #1... ?&lt;/p&gt;", "answer": "&lt;p&gt;... some answer ...&lt;/p&gt;", "category":"Ruby", "lang":"RoR"},
{"question":" &lt;p&gt;... some question #2... ?&lt;/p&gt;", "answer": "&lt;p&gt;... some answer ...&lt;/p&gt;", "category":"JQuery", "lang":"JQuery"}

]

The values of 'question' and 'answer' have to be be wrapped in &lt;p&gt;&lt;/p&gt; tags. You can use HTML inside those tags as you wish.

The key 'category' should be either 'Ruby' or 'Rails' or 'JQuery'.
The key 'lang' should be either 'RoR' or 'JQuery'.

All keys in hash are mandatory.
 
* Ruby version - 2.4.0, Rails - 5.x
* Provide your e-mail settings in config/initializers/my_mail_config.rb
* When first running - seed the database with 'export.csv'

