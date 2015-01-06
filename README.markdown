#makepages

`makepages` is a simple static site generator. It's built on `make`, `markdown` and some shell utilities. It also takes advantage of `git` for publishing to Github pages.

##usage
 
    $ git clone https://github.com/juhohei/makepages.git && cd makepages

After you have the repo, you need to set your Github pages as remote repository:

    $ git remote remove origin
    $ git remote add origin https://github.com/<YOURUSERNAME>/<YOURUSERNAME>.github.io.git

Before you can start writing, get [example files](#examples) or make your own.

    // new post:
    $ make new title="title of your post"
    // write some markdown in the post that just opened $EDITOR
    // to build the site:
    $ make
    // publish to github pages:
    $ make publish m="commit message"

##examples

To get the ready-to-go files, just run `mv example/* . && rmdir example`. You can see a live version at [my pages](http://juhohei.github.io).

