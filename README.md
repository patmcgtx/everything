# About Everything 

This app will let you save endless ideas and intertesting things (photos, websites, music, and well, just about _everything_) off in a quick, conveinent, mobile way.

It's an app this is kind of, sort of, out there in the form of apps like  Notes, etc. but what I have in mind is a little less oriented towards notes and a little more "buckets of stuff" or maybe sort of cards.

Hopefully this all makese sense in the end. 🙌

# To Do

- [ ] Review this doc, which was hashes out quickly. and fix any type-os, eyc. 😆
- [ ] Add links and examples 

# Requirements 

## Buckets
The main screen shows buckets in a nice collection view.

You can create any nunber of buckets to store items in. 

Each bucket has a title, a description, and a cover image.

👉 Examples are: "Restaurant to try", "Movies I love", "Book research"

## Items
An item is something with a title, a description, and any number of attachemnts.

👉 Examples are: a web link, a photo, a bunch of photos, a music file

An item can be saved into _any nunber_ of buckets.  So for example, "Range Life" might be in the bucket "Songs I like" and also "Songs to cover" as the _same_ entry.

Eventually, I'd like for items to be able to link to each other, and to do so in the quickest, easiest, most mobile way possible (ie with one thumb).

## Tags

Items and bucketrs can be tagged with any number of user-created tags.

👉 I'd like to "normalize" tags (probaby to lowercase) to avoid issues like "funny" and "Funny" being different tags

## Syncing 

We'll use iCloud to sync all you stuff acorss devices.  This way, everything is autoatic.  There's no need for you to set up a new acount and no ned for me to sign up for and configure a 3rd-party service.a

In this way, it will sync seemlessly like standard  apps such as Calendar, Notes, Reminders as well as top-notch 3rd-party apps such as Ulysses (TODO link).

## Share sheets

Once the core functionality is done, a key feature is to support iOS sharing into this app.

👉 Eventaully, I think this will be the _easiest and quickest way_ to add itemss to the app. 

For example, you can select some photos from the Photos app and "share" them into a bucket (or a few), add some notes and tags, and you're done.

# Tech notes

This app will use the latest and greatet (and almst too easy)  stack, most espeically:

* SwiftUI for all views
* SwiftData for persistence

I wil aim to minimize depdencies and keep things as simple as humanly possible.

## Development process

While I do have a nice, polished UI in mind (and even have some comps in Sketch), my plan is to _make it work first_ and then make it pretty and perfect.

This will let me get the main concepts right and pretty things up however I want as a final pass.

👉 So this app is going to be ugly AF until the final phase.  I even have some tickets with the note "SAF and UAF", reminding me to keep it simple AF and ugle AF _for now_.
