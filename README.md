# CONEMO Dashboard Features

This test suite tests the
[CONEMO Dashboard](https://github.com/nu-cbits/conemo_dashboard).

## Set Up

You will need to clone the repo linked above.

Then from this suite's directory run

```
rake load_app_local
```

You will need to setup a `env.rb` file located in the `spec` directory. This
file should have the following variables:

```
Firefox_Path, Base_URL, EN_Admin_Email, EN_Admin_Password, PE_Admin_Email,
PE_Admin_Password, BR_Admin_Email, BR_Admin_Password, EN_Nurse_400_Email,
EN_Nurse_400_Password, EN_Nurse_401_Email, EN_Nurse_401_Password,
PE_Nurse_Email, PE_Nurse_Password, BR_Nurse_Email, BR_Nurse_Password
```

To run this suite headlessly, run:

```
driver=poltergeist rspec --tag ~browser
```

Otherwise, run

```
rspec
```

**NOTE:** This suite uses a specific version of Firefox. This is due to dependency
issues with the version of selenium-webdriver that is being run. I am using
version 38.0 of Firefox for this suite. You can download it
[here](https://ftp.mozilla.org/pub/firefox/releases/38.0/mac/en-US/).
You will need to specify the path to this version of Firefox in the `env.rb`
file as `ENV['Firefox_Path']`.
