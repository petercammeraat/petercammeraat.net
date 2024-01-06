---
title: Getting an entitlement for Family Controls (Distribution)
date: 2023-03-30 05:00
description: Getting an entitlement for Family Controls (Distribution)
tags: projects, quiet
---

In February I wanted to release an update for Quiet. There is a big update to the iOS app. Quiet can hide apps according to the rules 
active in Quiet. For example if you block TikTok in Quiet, the TikTok app will disappear from your iOS device.

To do this I use the ScreenTime API. For using the ScreenTime API the Family Controls capability is needed. Unfortunately I [discovered](https://developer.apple.com/documentation/familycontrols) this was only for development and **not** for distribution:

> This capability adds the Family Controls entitlement to your app. Before submitting your app to the App Store, you must request permission to use the entitlement.

Using this [form]( https://developer.apple.com/contact/request/family-controls-distribution) you can request a "Family Controls & Personal Device Usage Entitlement".

I did it on 2023-02-19 and got the entitlement on 2023-03-30, it took 40 days to get the entitlement from Apple.

Early today I got an email from Apple:

> The entitlement for Family Controls (Distribution) has been assigned to your account, and you can now configure this capability for eligible apps. If you’re enrolled as an organization, Admins on your team can also use this capability. 

Adding this entitlement to your project is easy. You can find all [documentation here](https://developer.apple.com/help/account/reference/provisioning-with-managed-capabilities).

An Additional Capabilities tab has appeared in the Identifier page of you project at Certificates, Identifiers & Profiles.

![Additional Capabilities tab](assets/images/journal/getting-an-entitlement-for-family-control-distribution/additional-capabilities.png "Additional Capabilities tab")

Lesson learned: RTFM 😂
