//
//  main.swift
//  petercammeraat.net
//  BSD 3-Clause License
//  Copyright 2024 Peter Cammeraat
//

import Foundation
import Publish
import Plot
import SplashPublishPlugin

// This type acts as the configuration for your website.
struct MyWebsite: Website {
    enum SectionID: String, WebsiteSectionID {
        case journal
        case projects
        case about
        case contact
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://petercammeraat.net")!
    var name = "Peter Cammeraat"
    var description = "Welcome to my space on the internet. Building software with Swift."
    var language: Language { .ukEnglish }
    var imagePath: Path? { nil }
}

try MyWebsite().publish(using: [
    .installPlugin(.splash(withClassPrefix: "splash-")),
    .copyResources(),
    .addMarkdownFiles(),
    .sortItems(by: \.date, order: .descending),
    .generateHTML(withTheme: .yellow),
    .installPlugin(.minifyCSS()),
    .generateRSSFeed(including: [.journal], config: RSSFeedConfiguration(targetPath: "index.xml")),
    .installPlugin(.generateRSSFeedsForTags()),
    .generateSiteMap()
])
