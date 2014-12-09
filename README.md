RHoK Registration (branch)
==========================

## To modify

Edit the form in `db/seeds.rb`.
Edit the label pdf in `app/services/token.rb`.

## To execute

```
bundle install
```

> The cups gem won't work on Yosemite (until late January, maybe?), so you'll have to check it out, make some changes, and build it locally.

```
bundle exec rails s
```

This starts the web server. Hit the `register` link at the botto of the page for the form wizard.

```
bundle exec rake print_loop[http://localhost:3000]
```

This starts the polling loop for the label printer. It's expecting a json parseable date in `last_known.txt`.
Adjust accordingly if you have hosted the rails app somewhere else :)

## To inspect

```
mongo

connecting to: test
> use firststop-development
switched to db firststop-development
> db.people.find()
...
```

Hopefully, you know your way around mongo . . .

And to reprint a bunch of labels, just stick the date you want in `last_known.txt`, and wind it back a second, or whatever.
