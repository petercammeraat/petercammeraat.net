---
title: Moving away from building Prettified JSON Viewers
date: 2023-04-19 05:00
description: Moving away from building Prettified JSON Viewers
tags: ux
---

At my jobby job the status quo is that we build apps like this: 

![Flow of status quo](assets/images/journal/moving-away-from-building-prettified-json-viewers/status-quo.png "Flow of status quo")

- View tells Controller* I want to show X
- Controller tells Backend, I want X
- Backend sends X back to Controller
- Controller makes X useful for View
- Controller tells View I have X for you
- View shows X

<small>_*_ for simplification I called it a controller, it is an illustration of the layer(s) between backend and a view</small>

I call this Prettified JSON Viewers. I do not remember who coined this term first, if you know please send me an email to sayhello [at] petercammeraat.net - think it was on a podcast.

It is very boring. Offloads all the logic and storage of data to a backend. Which often require the user to create an account.


## Proposed Flow

I want to challenge it. Make the flow a bit more complex:

![Proposed change of flow](assets/images/journal/moving-away-from-building-prettified-json-viewers/proposed-change.png "Proposed change of flow")


In this new flow there is a Local Database and a Sync Engine added. 

Local Database is responsible for storing all the data and the data from the Local Database is used in the app.

Sync Engine is responsible for keeping the Local Database and the Backend in sync. Large parts of the app only talk to the Local Database and never to the Backend directly.


### Why do you ask?

- By making Sync Engine responsible for most network calls we only have to build it once.
- With a Local Database it is much easier to create an excellent offline experience of the app.
- Prepares for more advanced stuff done on device.
- Easier to test
- Backend and Frontend can work simultaneously instead of being blocked and dependent



### Some scenarios

**Just showing things that are already there**

- View tells Controller I want to show X
- Controller tells Local Database, I want X
- Local Database sends X back to Controller
- Controller makes X useful for View
- Controller tells View I have X for you
- View shows X

**What about changing things?**

- View tells Controller I want to change X
- Controller tells Local Database, I want to change X
- Local Database sends changed X back to Controller
- Controller tells View here is changed X
- View shows changed X
- In the background Local Database tells Sync Engine X has changed
- Sync Engine tells Backend X has changed


**Second device?**

On Device A:
- X has changed in the Local Database
- Local Database tells Sync Engine
- Sync Engine tells Backend

On the Backend:
- Backend notifies all subscribers to X with a silent push notification including Device B

On Device B:
- Device B has subscribed to X
- Gets silent push notification
- Sync Engine on Device B ask Backend for changed X
- Backend sends back X
- Sync Engine puts it in the Local Database
- Local Database see that there is something new
- Local Database tells Controller
- Controller tells View
- View shows changed X
