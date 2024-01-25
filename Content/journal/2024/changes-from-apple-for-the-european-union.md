---
title: Changes from Apple for the European Union
date: 2024-01-25 21:00
description: Changes from Apple for the European Union
tags: apple, eu
---

So it was a while in the making, we finally know how Apple is going to comply with the DMA rules of the European Union. There is a lot to read and dig through. I will try to compile a list of pages and quotes from those pages I found interesting.


#### Official announcement

> Apple today announced changes to iOS, Safari, and the App Store impacting developers’ apps in the European Union (EU) to comply with the Digital Markets Act (DMA). The changes include more than **600 new APIs**, expanded app analytics, functionality for alternative browser engines, and options for processing app payments and distributing iOS apps. Across every change, Apple is introducing new safeguards that reduce — but don’t eliminate — new risks the DMA poses to EU users. With these steps, Apple will continue to deliver the best, most secure experience possible for EU users.

→ [https://www.apple.com/newsroom/2024/01/apple-announces-changes-to-ios-safari-and-the-app-store-in-the-european-union/](https://www.apple.com/newsroom/2024/01/apple-announces-changes-to-ios-safari-and-the-app-store-in-the-european-union/)


#### Update on apps distributed in the European Union

> Apple is sharing changes to iOS, Safari, and the App Store, impacting developers’ apps in the European Union (EU) to comply with the Digital Markets Act (DMA). These changes create new options for developers, including how they can distribute apps on iOS, process payments, use web browser engines in iOS apps, request interoperability with iPhone and iOS hardware and software features, access data and analytics about their apps, and transfer App Store user data.
> <br/><br/>
> The changes are available for developers who distribute apps in any of the **27 EU member countries** and only apply to apps available and distributed to users in the EU. For existing developers who want nothing to change for them — from how the App Store works currently and in the rest of the world — no action is needed, and they can continue to distribute their apps only on the App Store and use its private and secure In-App Purchase system.

→ [https://developer.apple.com/support/dma-and-apps-in-the-eu/#Introduction](https://developer.apple.com/support/dma-and-apps-in-the-eu/#Introduction)


#### Notarization for iOS apps

> Notarization for iOS apps is a baseline review that applies to all apps, regardless of their distribution channel, focused on platform policies for security and privacy and to maintain device integrity. Through a combination of automated checks and human review, Notarization will help ensure apps are free of known malware, viruses, or other security threats, function as promised, and don’t expose users to egregious fraud.

→ [https://developer.apple.com/support/dma-and-apps-in-the-eu/#ios-app-eu](https://developer.apple.com/support/dma-and-apps-in-the-eu/#ios-app-eu)

Like on the Mac with some extra's. And fair enough.


#### Using alternative payment options on the App Store in the European Union

> For linking out, the commission applies to sales of digital goods or services that are initiated within **seven** calendar days after the user taps “Continue” on the in-app notice sheet. This includes any adjustments for refunds, reversals and chargebacks.

> For auto-renewable subscriptions, a transaction is classified as, (i) a sale initiated, including with a free trial or offer, within **seven** calendar days after a link out; and (ii) each subsequent renewal after the subscription is initiated. For both linking out and in-app transactions using an alternative payment service provider, subsequent subscriptions renewals will be included for commission until the customer cancels their subscription, performs a new purchase outside of the seven day window without using the link within the app, or until you inactivate their subscription due to payment issues. Renewals will continue on the payment processor where the subscription was initiated.

→ [https://developer.apple.com/support/apps-using-alternative-payment-providers-in-the-eu/](https://developer.apple.com/support/apps-using-alternative-payment-providers-in-the-eu/)

For seven days after the user is guided to your own payment system Apple will receive commission for those sales. 


#### Using alternative browser engines in the European Union

> iOS 17.4 introduces new capabilities that let iOS apps use alternative browser engines — browser engines other than WebKit — for dedicated browser apps and apps providing in-app browsing experiences in the EU.

→ [https://developer.apple.com/support/alternative-browser-engines/](https://developer.apple.com/support/alternative-browser-engines/)

Choice in which browser you want to use is always good. I am however afraid that Chrome becomes even bigger. Hate to see that happen. Will stick to Safari myself off course.


#### HCE-based contactless transactions for banking and wallet apps in the European Economic Area

> iOS 17.4 introduces new APIs for developers to support contactless payment transactions from within their banking or wallet apps using host card emulation (HCE). Users based in the European Economic Area (EEA) with an iPhone running iOS 17.4 or later can initiate in-person payment transactions from a banking or wallet app at compatible NFC terminals or mobile devices that accept contactless payments.

→ [https://developer.apple.com/support/hce-payment-transactions-in-payment-apps/](https://developer.apple.com/support/hce-payment-transactions-in-payment-apps/)


#### Requesting interoperability with iOS in the European Union

> Apple has designed a new process for developers of iOS apps in the European Union to request additional interoperability with hardware and software features built into iPhone and iOS under Article 6(7) of the EU Digital Markets Act (DMA). Apple will evaluate each request and inform you about the outcome of its review.

→ [https://developer.apple.com/support/ios-interoperability/](https://developer.apple.com/support/ios-interoperability/)

This is nice. I have a request in mind.


#### Expanded developer app analytics and user data portability

> To reflect the DMA’s changes, Apple will expand the analytics available for developers’ apps both in the EU and around the world to help developers get even more insight into their businesses and their apps’ performance. Over 50 new reports will be available through the App Store Connect API to help developers analyze their app performance and find opportunities for improvement with more metrics in areas like:
> <br/>
> **Engagement** — with additional information on the number of users on the App Store interacting with a developer’s app or sharing it with others;<br/>
> **Commerce** — with additional information on downloads, sales and proceeds, pre-orders, and transactions made with the App Store’s secure In-App Purchase system;<br/>
> **App usage** — with additional information on crashes, active devices, installs, app deletions, and more.<br/>
> **Frameworks usage** — with additional information on an app’s interaction with OS capabilities such as PhotoPicker, Widgets, and CarPlay.

→ [https://developer.apple.com/support/dma-and-apps-in-the-eu/#app-analytics](https://developer.apple.com/support/dma-and-apps-in-the-eu/#app-analytics)


#### Core Technology Fee

> The Core Technology Fee (CTF) is an element of the new business terms in the European Union (EU) that reflects the value Apple provides developers through ongoing investments in the tools, technologies, and services that enable them to build and share innovative apps with users around the world. Developers can choose to remain on the App Store’s current business terms or adopt the new business terms for iOS apps in the EU.

> Developers operating under the new business terms for EU apps will have the option to distribute their iOS apps in the EU on the App Store and/or alternative app marketplaces. These developers can also use alternative payment processors in their apps in the EU on the App Store across Apple operating systems. For developers who choose to agree to the new business terms, membership in the Apple Developer Program includes one million first annual installs per year for free for apps distributed from the App Store and/or alternative marketplaces. Developers who achieve exceptional scale on iOS, with apps that have over one million first annual installs in the past 12 months in the EU, will pay a Core Technology Fee.

> Only certain kinds of installs can be considered a first annual install, such as the **first time** an app is ever installed, redownloads of an app that was previously installed, and app updates, as long as they start a new 12-month period. Other installs, such as reinstalls of offloaded apps, iCloud transfers, and auto-downloads onto additional iOS devices by the same Apple account in the EU won’t be considered first annual installs.

→ [https://developer.apple.com/support/core-technology-fee/](https://developer.apple.com/support/core-technology-fee/)


#### Fee Calculator

> Apple is sharing new business terms available for developers’ apps in the European Union. Developers can choose to adopt these new business terms, or stay on Apple’s existing terms. For existing developers who want nothing to change for them — from how the App Store works currently and in the rest of the world — no action is needed, and they can continue to distribute their apps only on the App Store and use its private and secure In-App Purchase system. Developers must adopt the new business terms for EU apps to use the new capabilities for alternative distribution or alternative payment processing. For apps in the EU member states where the DMA is taking effect, the following options will be available:

> **Today’s capabilities and terms** — the same capabilities and terms used today, where developers distribute on the App Store and pay Apple a commission on the sale of digital goods and services. Developers continuing with these capabilities and terms for their EU apps do not need to take any further action

> **New capabilities and terms for apps in the EU** — where developers have additional distribution and payment processing options available. Apple will apply a reduced commission, an optional payment processing fee, and a fee for first annual installs above one million in the last 12 months. 

→ [https://developer.apple.com/support/fee-calculator-for-apps-in-the-eu/](https://developer.apple.com/support/fee-calculator-for-apps-in-the-eu/)


#### My thoughts

If you have a lot (1 million plus) of installs every year but not a lot of revenue. For example for free apps with donation buttons in it, or small amounts of one time purchases. The new terms are not worth it.

To show you:

- 2 million first installs per year in the EU
- $25000 revenue per year from users in the EU

##### Todays terms

I would pay $313 per month on commission with todays terms.

![Fee calculator: todays terms](../../../assets/images/journal/changes-from-apple-for-the-european-union/fee-calculator-todays-terms.png "Fee calculator: todays terms")

##### New terms

I would pay $45561 per month on commission/fees with the new terms.

![Fee calculator: new terms](../../../assets/images/journal/changes-from-apple-for-the-european-union/fee-calculator-new-terms.png "Fee calculator: new terms")

Maybe the are going to tweak the Core Technology Fee a bit. We will see. And non-profits, government organisations, and education institutions can apply for a fee waiver. 

There is a lot to read and think about. Hope you found this overview helpful :-)


<small><small>#100DaysToOffload 8/100</small></small>
