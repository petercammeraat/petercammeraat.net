---
title: Update on privacy in Apple's ecosystem
date: 2023-06-08 05:00
description: Update on privacy in Apple's ecosystem
tags: wwdc, privacy
---

Every year I watch the WWDC sessions that have to do with privacy. I find them very interesting. So this year for the first time I
will try to write a summary about it. Saved you watching 4 WWDC sessions with a total time of 1 hour and 15 minutes.

## The 4 privacy pillars

##### 1. Data minimisation

Limit the utilisation of data to the necessary information for constructing a feature. This principle should be 
followed across the entire architecture of your application, including the extent of data accessed for features, 
data exchanged with application servers, and data that could potentially be shared with external entities.

##### 2. On-device processing

Leverage the capabilities of the device to locally process data and prevent any need for sharing it with external servers.

##### 3. Transparency and control

Transparency and control involve ensuring that individuals comprehend the details of data access and processing, 
including the what, why, when, and where aspects, while providing them with sufficient controls beforehand. 
Additionally, it involves empowering them to modify their preferences at a later stage.

##### 4. Security protections

Implement powerful technical measures to uphold the remaining principles, including the implementation of end-to-end encryption.


## What is new this year?

### Photo picker

Introducing improvements to the Photos picker, designed to provide easy access to photos. This empowers users 
to make specific decisions about the data they share with your app. With the Photos picker, users can selectively 
share chosen photos or videos without granting access to their entire library. It seamlessly integrates into your 
app and ensures user control over their photos. Customisation options allow you to tailor the picker's appearance, 
while its efficiency eliminates the need for complex permission requests or designing a photo-picking flow. Consider 
adopting the picker to access photos individually, avoiding the need for full access.


### Screen Capture picker

Introducing a new API, [ScreenCaptureKit](https://developer.apple.com/documentation/screencapturekit), for macOS that enhances screen sharing by enabling selective sharing of 
windows or screens required by your app. With the SCContentSharingPicker API in macOS Sonoma, users can choose 
specific screen content to share, avoiding the need to grant full screen recording permission to conferencing apps. 
The selected content is shared immediately upon selection, ensuring a better experience. Your app can record the 
chosen content throughout the screen capture session without requiring separate permission or building a custom 
content picker. macOS Sonoma includes a screen sharing menu bar item to remind users that the screen is being 
recorded, providing a preview and options to add, remove, or end the capture session. Customisation options 
are available to tailor the picker to your app's requirements, such as selection modes or preferred applications.


### Calendar

Calendar integration in your app now offers a seamless experience, particularly for apps focused on creating new events. 
Apple has introduced two important changes to Calendar access:

1. EventKitUI: If your app only creates new events, EventKitUI allows you to render view controllers outside your app 
without explicit permission, maintaining the same functionality.
2. Add-only permission: For apps with custom event creation UI, a new add-only calendar permission is 
available. It enables adding events without accessing other calendar events, seamlessly integrating your 
app's events into the user's schedule.

When full Calendar access is required later, you can request an upgrade with user consent. Ensure clear explanations 
and appropriate timing to avoid rejections that impact the user experience.

Remember, providing a meaningful purpose string and aligning the request with user intent are essential for users to 
understand the necessity of access. Previous Calendar access defaults to write-only permission upon upgrading to 
iOS 17 or macOS Sonoma. If your app is linked against an older version of EventKit and requests Calendar access, 
the system prompts for write-only access. In such cases, attempting to fetch Calendar events triggers an automatic 
prompt for an upgrade to full access.


### Oblivious HTTP API

The Oblivious HTTP API, a powerful tool for safeguarding user privacy. This API helps conceal client 
IP addresses from your servers and shields potentially sensitive app usage patterns from network operators.

The knowledge of when and which apps individuals use can reveal profound insights into their lives. 
Network operators, with their ability to observe server connections, can gain access to personal app usage 
and behavioural patterns. This can be particularly concerning for apps like dating or health-related applications.

IP addresses, while necessary for internet communication, can be exploited to determine someone's 
location or identity. Exposure to IP addresses can pose challenges when implementing anonymous 
features like client analytics.

To address these concerns, Apple platforms now support Oblivious HTTP (OHTTP). OHTTP is a lightweight, 
standardised internet protocol that proxies encrypted messages at the application layer, facilitating 
fast transactional server interactions. With OHTTP, network operators can only observe a connection to 
the relay provider rather than your application server.

The central element of this architecture is the relay, which possesses the client's IP address and the 
destination server name but remains unaware of the encrypted content. The relay always sees connections 
to your application server, but the only significant information it gains is the client IP. The relay 
establishes the final connection to your application server.

By utilising a third-party-operated relay, no single entity retains complete visibility over the 
source IP, destination IP, and content. This enables the addition of technical guarantees for features 
where user identification or tracking is undesired, such as anonymous analytics.

Embracing OHTTP empowers you to create robust internet privacy protections that significantly impact users. 
Services like iCloud Private Relay already leverage OHTTP for its exceptional performance and strong 
privacy safeguards, such as protecting all DNS queries.

With OHTTP support, you have the opportunity to enhance privacy measures and provide a 
meaningful impact on user privacy.


### Sensitive Content Analyse framework

Introducing Communication Safety and the Sensitive Content Analysis framework, powerful 
tools for child protection in your app.

Communication Safety keeps children safe by warning and providing resources for nudity-related 
photo sharing. It goes beyond Messages, covering AirDrop, FaceTime, contact posters, and the Photos picker.

Sensitive Content Warning makes these features available to all. The new Sensitive Content Analysis 
framework enables on-device content detection with system-provided ML models. No external server 
sharing is required, and integration is straightforward with minimal code.

To start, create an instance of SCSensitivityAnalyzer. Check the `analysisPolicy` attribute for 
intervention instructions. Use `analyzeImage` for photos or `videoAnalysis` for videos, tracking progress 
with the handler. Retrieve results using `hasSensitiveContent`. If `isSensitive` is true, the content 
likely contains nudity. Provide your own intervention, like blurring, with an option to view it.


### Privacy manifests

As an app developer, you are responsible for all code in your apps, including data collection and tracking 
practices. Third-party SDKs play a significant role in your app's privacy, but getting the necessary 
information from them can be challenging.

Privacy manifests are here to help. Third-party SDK developers can include a privacy manifest, created as 
a "PrivacyInfo.xcprivacy" property list file in Xcode. This manifest declares the types of data collected, 
their usage, whether they are linked to users, and if they involve tracking as defined by the App 
Tracking Transparency policy.

To ensure accuracy, review the privacy manifest and make sure it aligns with your understanding of the 
SDK's functionality. The definitions in the manifest match those of the Nutrition Label, so refer to 
Apple's developer [documentation](https://developer.apple.com/documentation/bundleresources/describing_data_use_in_privacy_manifests/) for details.

With Xcode 15, you can generate a privacy report for your app that summarises the data uses declared in 
all privacy manifests. This report, presented as a PDF, follows the format of Privacy Nutrition Labels, 
making it easier for you to describe your app's privacy practices in App Store Connect.

Privacy manifests also assist in managing tracking domains, helping you understand and control network 
connections from your app. By declaring tracking domains in the manifest, iOS 17 automatically blocks 
connections to those domains when tracking permission is not granted.

During testing, the Points of Interest instrument in Xcode 15 highlights connections to domains that 
may engage in cross-app and cross-website tracking. You can assess if a domain qualifies as a tracking 
domain under App Tracking Transparency and declare it in the privacy manifest accordingly.

Remember, tracking is allowed with user permission, but fingerprinting is never allowed. To support 
beneficial use cases without enabling fingerprinting, Apple introduces Required reason APIs. These 
APIs come with approved reasons for access, and you must declare their usage in privacy manifests.

Privacy manifests provide a comprehensive view of your app's privacy story, and they are particularly 
crucial for privacy-impacting SDKs. Apps containing such SDKs must include a copy of the SDK with a 
privacy manifest, and SDK signatures are recommended for all third-party SDKs.

Starting in Fall 2023, App Store checks will require privacy-impacting SDKs to have a signature and 
privacy manifest. Apps accessing Required Reason APIs without declaring approved reasons will also 
receive informational emails. These requirements will become part of App Review in Spring 2024.

As an app developer, ask for privacy manifests from third-party SDK developers and refer to the 
Xcode privacy report when submitting your app. SDK developers should adopt signatures and manifests, 
while all developers must document and declare tracking domains and Required Reason API usage in 
their privacy manifests.

With privacy manifests, providing accurate and transparent privacy information to your users 
is easier than ever.

Apple will publish additional information later this year, including:

- A list of privacy-impacting SDKs (third-party SDKs that have particularly high impact on user privacy)
- A list of “required reason” APIs for which an allowed reason must be declared
- A developer feedback form to suggest new reasons for calling covered APIs
- Additional documentation on the benefits of and details about signatures, privacy manifests, and when they will be required


### Dependency signature verification

Using third-party SDKs can simplify app development and offer additional functionality, but it also comes with risks. 
Supply chain security is crucial for mitigating these risks and protecting users. Developers must be cautious when 
choosing dependencies and ensure they don't inadvertently use a compromised version. This responsibility extends to 
SDK authors who include other SDKs in their development process. Manual mitigation of these risks can be burdensome 
and complex.

To address this, Xcode introduces a new feature called dependency signature verification, which automates and 
simplifies the process. Digital signatures play a vital role in safeguarding developers and reducing the burden 
associated with supply chain security. Apple's code signing technology is used to cryptographically link the 
compiled binary and associated metadata, such as the Info.plist or privacy manifest, with the developer's identity.

The code signing process involves generating a Code Directory hash for the binary, which is then signed 
using the developer's certificate. This certificate consists of a private key for code signing and a public key 
distributed as part of the signature. The signature verifies the identity of the developer and can be used to 
detect tampering. For XCFramework dependencies, the code signature resides within the _CodeSignature directory, 
ensuring the integrity of all files within the framework.

Xcode 15 introduces a "Signature" view in the Inspector, which displays the signature status for included 
XCFramework. It provides information about the author's identity, indicating whether the XCFramework is 
signed by an Apple Developer Program identity, a self-signed certificate, or remains unsigned. Xcode records 
the identity during the initial use of an XCFramework and verifies its consistency in subsequent builds. 
Different levels of features are offered based on the trust in the identity used.

Xcode automatically validates the XCFramework author's signing certificate and alerts developers if the 
signature is invalid, the identity has changed, or the certificate has expired or been revoked. For 
self-signed certificates, developers need to verify the fingerprint or contact the XCFramework author. 
Xcode ensures the integrity of the supply chain by notifying developers and offering to remove 
compromised XCFrameworks.

For SDK authors, it is essential to cryptographically sign SDKs using Apple Developer Program 
certificates to establish trust with clients. The certificates verify the author's identity and 
guarantee the integrity of the code. Apple handles certificate validation automatically, enhancing 
trust and security. SDK authors who are not Apple Developer Program members can use self-signed certificates 
but must share the certificate fingerprint for verification.

By utilising Xcode's signature verification feature, SDK authors can improve the security and 
authenticity of their SDKs, boosting client confidence in the supply chain. App developers 
should encourage SDK authors to sign their SDKs, while also leveraging Xcode 15's automated 
integrity and security checks for included dependencies. Responsible app development involves 
prioritising the verification of SDK signatures to protect users' security and privacy.



## What is updated this year?

### Apps data on macOS

Introducing enhanced privacy protections for macOS, designed to safeguard your app's data from 
other apps on the same device.

In macOS Sonoma, system-managed permissions control access to locations like the Desktop, 
Documents, and Downloads folders. This empowers users to manage when apps can access their 
private data, such as project presentations or budget spreadsheets.

For apps that store private data in different locations, like messaging apps or notes apps, 
macOS Sonoma provides additional control. Users must grant permission before an app can access 
data in another app's data container from a different developer.

To ensure your app benefits from these protections:
1. If your app stores data outside system-managed locations, adopt App Sandbox to extend the 
new protection to your users' data. Existing App Sandbox apps receive this protection automatically.
2. If your app needs to access data from other apps, macOS Sonoma will prompt for permission 
when accessing files in another app's data container. Ensure your app's access is expected, 
and provide a clear purpose string to explain the need for access.

To request explicit permission for file access from other apps:
- Use NSOpenPanel for seamless access to individual files and folders outside your app's process.
- Backup utilities or disk-management tools with Full Disk Access do not require an additional prompt.
- Apps signed with your Team ID can access data in your other apps' containers without a prompt.
- For a more restrictive policy, specify an NSDataAccessSecurityPolicy in your app's Info.plist 
to allow specific processes access to your app's data.


### Advanced Data Protection

With Advanced Data Protection, you have the opportunity to enhance data protection for your users.

Introduced in 2022, Advanced Data Protection enables end-to-end encryption for the majority of data 
stored in iCloud, offering heightened privacy. By utilising CloudKit, you can automatically apply 
end-to-end encryption to data stored by your app when users enable Advanced Data Protection.

No changes are required on your end to handle encryption keys, operations, or recovery flows. To extend 
the privacy benefits to your users, follow these simple steps:

1. Ensure all fields in your CloudKit schema use encrypted data types. This includes CKAsset fields, 
and there are encrypted variants available for most data types (e.g., EncryptedString).

2. Utilise the encryptedValues API to retrieve or store data in your CloudKit records. This API 
abstracts all encryption and decryption operations for your convenience.

By following these steps, your app's data will benefit from the robust security and privacy protections 
offered by Advanced Data Protection when users enable this feature.


### Safari

Safari's Private Browsing mode now includes enhanced protections against fingerprinting and tracking.

Designed with privacy as a priority, Safari's Private Browsing mode ensures that your browsing history, 
search history, and AutoFill information are not remembered when you close a tab.

In Safari 17, Private Browsing mode introduces advanced tracking and fingerprinting protection with two key features.

First, Safari blocks the loading of known tracking and fingerprinting resources. If you are a website developer, 
it is important to test your website's functionality in Private Browsing mode, specifically focusing on login flows, 
cross-site navigation, and the use of browser APIs related to screen, audio, and graphics. You can reload your 
website without the advanced protections to check if any changes in behavior are a result of these new safeguards.

To test without the protections, you can right-click on the reload button on macOS, use the page settings button 
on iOS, or test in Safari's normal browsing mode. You can also open the Web Inspector to review any output in 
the JavaScript console. Messages beginning with "Blocked connection to known tracker" indicate network requests 
that were blocked due to contacting known trackers.

The second protection in Private Browsing mode is the removal of tracking parameters during browser navigation 
and when copying a link. When Safari detects a tracking parameter, it removes the identifying components from 
the URL while keeping non-identifiable parts intact. This gives users more control over their tracking preferences.

It's important to note that ad attribution can still be achieved without identifying individuals across websites. 
Private Click Measurement, for instance, offers a privacy-preserving alternative for advertising attribution. 
This feature is now available in Private Browsing mode for direct-response advertising, ensuring that no data 
is written to disk and attribution is limited to a single browsing context within a single tab. This aligns 
with Safari's strict model of ephemeral browsing and tab separation in Private Browsing.

These new fingerprinting and tracking protections in Safari's Private Browsing mode further reinforce Safari's 
commitment to user privacy and provide a more secure browsing experience.



## My thoughts

I am happy that Apple keeps improving. The Privacy Manifests requirement for SDK's is a good step forward. Often
it feels like they are sucking way to much data, without a lot of control for the developer. Or developers do
not know at all because it sometimes is a black box. Good step! 

Also love the fact that apps can make use of the Advanced Data Protection. Gives me piece of mind in the next
project where I am going to use CloudKit.

The Oblivious HTTP API sounds very interesting and cannot wait to play with it.


#### Sources

- [What's new in privacy](https://developer.apple.com/videos/play/wwdc2023/10053/)
- [Get started with privacy manifests](https://developer.apple.com/videos/play/wwdc2023/10060/)
- [Verify app dependencies with digital signatures](https://developer.apple.com/videos/play/wwdc2023/10061)
- [Ready, set, relay: Protect app traffic with network relays](https://developer.apple.com/videos/play/wwdc2023/10002)
- [What’s new in privacy on the App Store](https://developer.apple.com/news/?id=av1nevon)
