## Quick start

* [Download Hugo](https://github.com/spf13/hugo/releases).

* Untar or unzip the archive and copy the `hugo` / `hugo.exe`
  executable to somewhere on your `PATH`.

* Run `hugo serve` in the root of this repository.

* Visit http://localhost:1313/.

## Starting a new project

1. Come up with a slug for your project. For the rest of this section
   we'll assume it's `my-cool-project`.

2. Run `bash newproject.sh my-cool-project`.

3. Edit `content/project/my-cool-project.md` to your liking, filling out
   its [project metadata](#project-metadata).

4. By default, your project has a placeholder featured image. You'll
   want to give it a real one by overwriting
   `static/project/my-cool-project/_featured.png`.

5. Be sure to add the new files to your git repository with e.g.
   `git add content static`.

### Adding images and other static assets

Static assets for your project are stored in
`static/project/my-cool-project`, so if you want to add any images
or other embedded content to you project page, you'll want to put it
there.

When you reference the asset from your project's markdown file,
you only need to include its filename, because the asset will be in
the same directory as the project page when the static site is generated.

For example, let's say you have a picture called `boop.jpg` that you'd
like to add to your project page. To do this:

1. First, copy the file to `static/project/my-cool-project/boop.jpg`.

2. Add the following to the body of `content/project/my-cool-project.md`:

   ```html
   <img src="boop.jpg" alt="some alt text">
   ```

## Directory structure

* `content/project/` contains all the individual projects in the
  portfolio; one markdown file for each project. Each file has
  some [project metadata](#project-metadata) at the top.

  The filename without the `.md` extension is called the *slug* and
  determines what the project's URL is, among other things. For instance,
  if you call the project `boop.md`, then its project detail page
  will be at `/project/boop/`.

* `layouts/` contains all the [Go templates][] for constructing every
  page in the portfolio.

* `static/` contains all the static assets for the site--e.g., JS, CSS,
  images, and so forth.

* `static/project/` contains static files relevant to a specific project,
  e.g. its featured image and any associated pictures that are shown
  on its detail page.

* `static/vendor/` contains static files that are provided by
  third-party sources.

* `public/` is the directory that Hugo will put the generated static
  site in whenever you run `hugo` without any arguments. It's not
  part of the actual git repository because it's automatically generated
  by all the other files in the repository.

* `archetypes/` contains a template for new project markdown files, used
  when you [start a new project](#starting-a-new-project).

## Project metadata

The stuff at the top of every project markdown file is called
*front matter* and defines some metadata for the project. We
use [YAML][] for the front matter. Here's some of the metadata
fields we use:

* `title` is the title of the project, displayed prominently near
  the top of the project detail page, and on the portfolio homepage.

* `core_value` is some text that fills-in-the-blank of the following
  sentence:

  > Good design should support _____________.

* `highlight_color` is the highlight color to use for the project. It
  should be one of `blue`, `yellow`, or `pink`.

* `featured_img_alt_text` is the alt text for the project's featured
  image. If the featured image is just a logo or something else purely
  decorative, this can be left blank, but if it helps a vision-impaired
  user understand a project better, it should be filled out.

* `quote` is a quote from Jess that explains why she thinks the project
  is important, and/or why she's proud of it.

* `links` is a list of external links where readers can find out more
  about the project. Each item has the following properties:

  * `title` is the title of the link, e.g. `Read the blogpost`.

  * `url` is the URL of the link, starting with `http://` or `https://`.

* `featured_in` contains information about a publication that the project
  has been featured in. It has the following properties:

  * `title` is the name of the publication.

## CSS

This project uses [Bulma][] for styling.

All of our own first-party CSS is in
[static/css/style.css](static/css/style.css).

In general, we try to put the word `jess` somewhere in the names of
first-party classes, to easily distinguish them from Bulma's built-in
classes.

## Deployment

To deploy to *staging*, run `bash deploy.sh`. The site will be
visible at https://toolness.github.io/jess-portfolio/.

To deploy to *production*, run `bash deploy_to_prod.sh`. The
site will be visible at http://jessklein.is/.

[Go templates]: https://gohugo.io/templates/go-templates/
[YAML]: https://en.wikipedia.org/wiki/YAML#Basic_components
[Bulma]: http://bulma.io/
