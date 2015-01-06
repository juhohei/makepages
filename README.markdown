#makepages

`makepages` is a simple static site generator. It's built on `make`, `markdown` and some shell utilities. It also takes advantage of `git` for pblishing to Github pages.

###usage
 
    $ git clone https://github.com/juhohei/makepages.git && cd makepages
    // to create a new post:
    $ make new
    Title: title of your post
    // write some markdown in the post that just opened $EDITOR
    // to build the site:
    $ make
    // publish to github pages:
    $ make publish


