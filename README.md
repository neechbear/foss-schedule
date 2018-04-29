# FOSS Schedule

This is (or will be) a lose collection of scripts that can be used to generate
a fairly accurate list of all my free and open-source software that I have
publically released.

Eventually it will produce a number of JSON files that will be rendered by a
static HTML page. Something like that anyway.

For the time being it only generated a list of my GitHub repositories. I am
pretty sure that most things (if not everything), is published on GitHub in
some form or another, so it functions as a reasonably good source of truth.

    $ make
    /home/nicolaw/src/foss-schedule/github-repos.sh NeechBear > github.csv
    GitHub Projects: github.csv
    $ head github.csv 
    name,description,language,html_url,created_at,updated_at
    "Acme-Stardate","Calculate dates in to Stardates","Perl","https://github.com/neechbear/Acme-Stardate","2014-06-22T19:00:42Z","2014-09-09T21:33:46Z"
    "ansible","Nicola's Ansible ramblings","Python","https://github.com/neechbear/ansible","2016-03-04T12:38:38Z","2018-04-04T13:52:24Z"
    "Apache2-AuthColloquy","mod_perl authentication against the Colloquy users.lua file","Perl","https://github.com/neechbear/Apache2-AuthColloquy","2014-06-22T19:01:37Z","2014-09-09T21:33:46Z"
    "Apache2-AutoIndex-XSLT","XSLT Based Directory Listings","Perl","https://github.com/neechbear/Apache2-AutoIndex-XSLT","2014-06-22T19:02:12Z","2014-09-09T21:33:46Z"

## Other Sources

If you are impatient, you may look at my usernames inside this projects 
[Makefile](Makefile), you explore the following URLs:

  * https://nicolaw.uk/nicolaw
  * https://nicolaw.uk/cv
  * https://github.com/neechbear
  * https://hub.docker.com/r/nicolaw/
  * https://launchpad.net/~nicolaw
  * http://search.cpan.org/~nicolaw/
  * http://uk.linkedin.com/in/perlgirl
  * https://stackoverflow.com/users/3784173/nicola-worthington
  * https://github.com/nokia/git-changelog-generator
  * https://github.com/nokia/gitcache-ssh
