---
title: Permission request guidelines
date: 2022-11-08 05:00
description: A good user experience for a permission request is important, because often permission request are the first thing the user sees. This can make or break the first impression about the app.
tags: ux
---

A good user experience for a permission request is important, because often permission request are the first thing the user sees. This can make or break the first impression about the app. In this note I will outline how this experience can be improved. 


## Why we request permission?

I will let an hero of mine speak. 

{{< video src="/assets/videos/permission-request-guidelines/steve-jobs-about-privacy-and-permissions.mp4" type="video/mp4" preload="auto" >}}

<small>Recorded during D8 Conference in 2010 and is an interview with Steve Jobs by Walt Mossberg and Kara Swisher.</small>

Permission request exist to inform the user what data is used for what purpose in an application.


## Communicate rationale 

The best permission requests communicate the rationale for the request. In one study of 15 mobile apps they found that users were 12% more likely to grant a permission request when given the reason for the request. The most compelling reason resulted in an 81% increase in requests being accepted compared to the least compelling. 

When users read a permission request; they ask themselves what benefit they get from granting this permission. and how much they trust the app to grant access. 

Designers need to write understandable copy. Especially when communicating the rationale for unexpected permission requests. To avoid scaring users and help them understand why the app requires access. 

**Examples**:

*Vague:* AppName would like to access your location for accommodation personalisation.

*Clear:* AppName would like to access your location, so that you can quickly select accommodations near you.


*Vague:* Allow AppName access to your camera for taking videos.

*Clear:* Allow AppName access to your camera, so you can take videos in the app to share with family.

Not all permission requests are presented with a purpose string. Design pre alert screens so the rationale can be communicated to the users before a permission request appears. 

> "**Include only one button and make it clear that it opens the system alert.** People can feel manipulated when a custom screen also includes a button that doesn’t open the alert because the experience diverts them from making their choice. Another type of manipulation is using a term like “Allow” to title the custom screen’s button. If the screen’s button seems similar in meaning and visual weight to the allow button in the alert, people can be more likely to choose the alert’s allow button without meaning to. Use a term like “Continue” or “Next” to title your custom screen’s single button, clarifying that its action is to open the system alert."

_-_ Apple Human Interface Guidelines


## It is all about timing

Permission requests asked in context are less likely to cause surprise. Users select an icon in the app or tap inside an address field, and the system reacts with a permission request. The context of the users’ action and timing of the permission request help them to reason about the meaning of the request.

Obstacles at the first time use can be overwhelming and confusing, first impressions are formed when users open an app for the first time. A better way is to ask only for core permissions upon the first launch. Ask for further permissions only when they are needed to offer the user extra functionality.

> “90% of permission prompts are dismissed or ignored”

_-_ Chris Wilson at Chrome Dev summit in 2018

This happens because webdevelopers often ask for permission when the webpage finished loading. Asking in context instead of upfront increases the accepting percentages.


> "**Request permission only when your app clearly needs access to the data or resource.** It’s natural for people to be suspicious of a request for personal information or access to a device capability, especially if there’s no obvious need for it. Ideally, wait to request permission until people actually use an app feature that requires access. For example, you can use the location button to give people a way to share their location after they indicate interest in a feature that needs that information."

_-_ Apple Human Interface Guidelines




## Permission denied

> "No is a valid answer"

Apps do not always need the permission they request to keep functioning. Location in a map app is very useful. To create directions the app needs a start and end point. Your location on the map makes it easy to have a start point. The app would function perfectly fine without a precise location.

Sometimes users initially deny access to a resource and then wish to reverse their decision.

Rather than reporting an error when users try to access a feature that relies on a denied permission. Clearly explain why that functionality cannot be used, and make it easier for them to give access.

Sometimes users do not mentally link a permission and a feature. Providing a message helps users to get the correct mental model of the application. 

Provide a link to where they can grant the permission.


## Fine-grained control

In the latest iOS 15 update multiple apps allow fine-grained control, on badges and banners. But also offer them in the app to give even more control to user.

Fine-grained control is not only used for notifications but you also see it being used for location access.

![Find My app](assets/images/journal/permission-request-guidelines/find-my-app.png "Find My app")

The Find My app is a good example. The app needs location access to see where my devices are. But the user can stop location data being used for the Share my location functionality of the app.



## Guidelines

#### Communicate

- focus on user oriented benefits
- inform user in pre alert screens
- be transparent
- use plain language
- do not use jargon
- do not manipulate

#### Timing
- do not show all permission requests at once
- do not request without providing value
- avoid asking for permissions upfront
- initiate permission request in context

#### Denied
- fail gracefully
- describe clearly why functionality is not working
- button that opens the settings of the permission

#### Control
- add fine-grained control when applicable


## Sources
- [https://developer.apple.com/design/human-interface-guidelines/patterns/accessing-private-data/](https://developer.apple.com/design/human-interface-guidelines/patterns/accessing-private-data/)
- [https://m2.material.io/design/platform-guidance/android-permissions.html#usage](https://m2.material.io/design/platform-guidance/android-permissions.html#usage)
- [https://dl.acm.org/doi/10.1145/2556288.2557400](https://dl.acm.org/doi/10.1145/2556288.2557400)
- [https://www.nngroup.com/articles/permission-requests/](https://www.nngroup.com/articles/permission-requests/)
- [https://uxplanet.org/getting-to-yes-best-practices-for-ios-permissions-dialogs-9d62892142cc](https://uxplanet.org/getting-to-yes-best-practices-for-ios-permissions-dialogs-9d62892142cc)
- [https://andrewchen.com/why-people-are-turning-off-push/](https://andrewchen.com/why-people-are-turning-off-push/)
- [https://stephaniewalter.design/blog/the-ultimate-guide-to-not-fck-up-push-notifications/](https://stephaniewalter.design/blog/the-ultimate-guide-to-not-fck-up-push-notifications/)
- [https://builtin.com/design-ux/push-notifications](https://builtin.com/design-ux/push-notifications)
