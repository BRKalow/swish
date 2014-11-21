MODELS
======

User
----
* username (text)
* email (text)
* num_snippets (int)
* num_collections (int)
* num_comments (int)

Snippet
-------
* language (text)
* title (text)
* body (text)
* num_favorites (int)
* num_views (int)
* num_comments (int)

Comment
-------
* user_id
* snippet_id
* body

Tag
----
* name (text)

Group
-----
* name
* picture

Collection
----------
* name
* user_id
* num_snippets
* num_likes

Favorite
--------
* user
* snippet
