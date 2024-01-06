---
title: SecKey moving to Universal Purchases
date: 2020-04-25 05:00
description: SecKey moving to Universal Purchases
tags: projects, seckey
---

First of all thank you for using SecKey all this time :-) I really appreciate the feedback you have given me and as always I will keep supporting and maintaining SecKey.

### What is Universal Purchases?

> Distribute iOS, iPadOS, watchOS, macOS, and tvOS versions of your app as a universal purchase to let customers easily enjoy your app and in‑app purchases across platforms. They’ll only need to purchase once on the App Store. [Learn](https://developer.apple.com/support/universal-purchase/) more...

SecKey is available on macOS and iOS. They are seperate app records, those cannot be merged. I've looked in the App Store Connect Analytics section and the macOS version of the app has bigger user base than the iOS version. In order to enable universal purchase I have to remove the current version of SecKey from the iOS App Store. A consequence is that this version of the app can no longer be updated.

### What you need to do

Download the new [SecKey](../../../projects/seckey/) 1.2 from the App Store and remove the the current version of the App. No data will be lost in the transfer to the new app.

### But why?

- For you it means you have "bought" the app once and have it available on all supported devices.
- For me it is easier to maintain the app and less administration with each update.
