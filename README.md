# patrickdelliott.com

The development branch of my new personal site, powered by Hakyll. 

## TODO

- [ ] write a custom pandoc writer in Lua that targets tufte.css.
- [ ] redesign css using tachyons.
- [ ] get pandoc to parse citations.
- [x] remove references to blog posts from the main executable.

## Instructions (using [stack](https://docs.haskellstack.org/en/stable/README/))

- clone this repo.
- `cd` into repo.
- run `stack init`.
- run `stack build`.
- after making any changes to the site, run `stack exec site deploy`.

## Workflow

- In `develop` branch, modify site and run `stack exec site watch` to preview any changes on a local server.
- Commit any changes and run, `stack exec site deploy` to deploy to http://patrickdelliott.com
- The `master` branch should never be touched.

