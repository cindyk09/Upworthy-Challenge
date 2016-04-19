Imagine that you've been given the task to implement full-text search on Upworthy.com. Currently, we outsource that functionality to Google Custom Search:

http://www.upworthy.com/search?q=cats

Using a combination of research and your own experience, describe how you'd build this feature. Which technologies would you use? How would you go about implementing?

Time limit: 60 minutes, both researching and writing the answer.

1. We would discuss with the team what type of search we've all used prior to this experience and see if something comes from there.
2. Next, I would search for search engines gems for ruby.
3. Once I've opened a few links and read about them I would dive deeper on each one and their pros and cons.
4. I would look into how many commits and contributions there are.
5. Also look into if it's still actively maintained. Example Utlrasphinx seemed to have good reviews but it is not maintained anymore. Thinking Sphinx is the next version of Ultrasphinx.
6. For the sake of this example I have decided to use Elasticsearch-rails. I would bring this up to the team with my reasons why we should go with Elasticsearch-rails such as pros and cons listed below.
Pros:
Up to date
Could do a reverse search
Could do multiple tupes of documents per index
Natively handles a nested document search

Con:
Split Brain situation: Meaning the way it handles clusters. When network fails and tries to be smart but creates two clusters running at the same time
Not many documentation
Missing: results grouping, autocomplete, spell checker, decision tree faceting, qurey, elevation, hash-based deduplication.


If everyone seems to agree with this decision I would proceed forward.

7. Since this is a gem I would start looking for documentation of others using this in their app.
8. I would start reading and seeing the different issues that could come up and being aware of it all.
9. Finally, I would gather the information that I've acquired during my research and follow the steps in installing the gem.
