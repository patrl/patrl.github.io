# patrickdelliott.com

The development branch of my new personal site, powered by Hakyll. 

## TODO

- [ ] write a custom pandoc writer in Lua that targets tufte.css.
- [x] remove references to blog posts from the main executable.

## Instructions (using [stack](https://docs.haskellstack.org/en/stable/README/))

- clone this repo.
- `cd` into repo.
- run `stack init`.
- run `stack build`.
- after making any changes to the site, run `stack exec site deploy`.
