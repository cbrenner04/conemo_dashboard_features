# CONEMO Dashboard Features

This test suite tests the
[CONEMO Dashboard](https://github.com/cbitstech/condemo_dashboard).

## Set Up

You will need to clone the repo linked above.

Then from this suite's directory run

```
rake load_app_local
```

To run the suite you will need to open a new tab. Then run

```
rspec
```

NOTE: This suite uses a specific version of Firefox. This is due to dependency issues
with the version of selenium-webdriver that is being run. I am using version
38.0 of Firefox for this suite. You can download it
[here](https://ftp.mozilla.org/pub/firefox/releases/38.0/mac/en-US/).
I would recommend installing it in a similar location to what is in the
`spec_helper.rb` so you don't need to update that file.
