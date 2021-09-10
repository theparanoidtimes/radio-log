# The Paranoid Times amateur radio logs

This is a log of all shortwave radio stations I caught.

## Usage

Site is developed by _[Hakyll](https://jaspervdj.be/hakyll/)_. It is
built and developed using _[Stack](https://docs.haskellstack.org/en/stable/README/)_.

### Development

Install _Stack_, then _Hakyll_ (using _Stack_).

To build:

``` shell
stack build
stack exec site build
```

This will produce the static site in both `_site` and `doc` directories.
The later is needed for GitHub Pages integration.

To view the site:

``` shell
stack exec site watch
```

This will start the server and the site will be visible on `localhost:8000`.
The process will monitor the changes on the static files and automatically apply them.

When changes are made to the `site.hs` file, we whole site needs to be rebuilt.

``` shell
stack build
stack exec site rebuild
stack exec site watch
```

## Production

The site is published as soon as the changes are pushed to GitHub.
Before pushing, perform a clean build of the site.

``` shell
stack exec myblog clean
stack exec myblog build
```

## License

Copyright 2021 Dejan Josifović, The Paranoid Times

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
