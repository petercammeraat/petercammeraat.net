//
//  SiteHead.swift
//  petercammeraat.net
//  BSD 3-Clause License
//  Copyright 2024 Peter Cammeraat
//

import Publish
import Plot

public extension Node where Context == HTML.DocumentContext {
    static func customHead<T: Website>(
        for location: Location,
        on site: T,
        titleSeparator: String = " | ",
        stylesheetPaths: [Path] = ["/styles.css"],
        rssFeedPath: Path? = .defaultForRSSFeed,
        rssFeedTitle: String? = nil
    ) -> Node {
        var title = location.title

        if title.isEmpty {
            title = site.name
        } else {
            title.append(titleSeparator + site.name)
        }

        var description = location.description

        if description.isEmpty {
            description = site.description
        }

        return .head(
            .encoding(.utf8),
            .viewport(.accordingToDevice),
            .element(named: "title", text: title),
            .meta(.name("description"), .content(description)),
            .link(.rel(.canonical), .href(site.url(for: location))),
            .stylesheet("/styles.css"),
            .rssFeedLink("https://petercammeraat.net/index.xml", title: "Subscribe to \(site.name)"),
            .link(.rel(.me), .href("https://defcon.social/@petercammeraat")),
            .link(.rel(.appleTouchIcon), .sizes("57x57"), .href("/assets/favicons/apple-icon-57x57.png")),
            .link(.rel(.appleTouchIcon), .sizes("60x60"), .href("/assets/favicons/apple-icon-60x60.png")),
            .link(.rel(.appleTouchIcon), .sizes("72x72"), .href("/assets/favicons/apple-icon-72x72.png")),
            .link(.rel(.appleTouchIcon), .sizes("76x76"), .href("/assets/favicons/apple-icon-76x76.png")),
            .link(.rel(.appleTouchIcon), .sizes("114x114"), .href("/assets/favicons/apple-icon-114x114.png")),
            .link(.rel(.appleTouchIcon), .sizes("120x120"), .href("/assets/favicons/apple-icon-120x120.png")),
            .link(.rel(.appleTouchIcon), .sizes("144x144"), .href("/assets/favicons/apple-icon-144x144.png")),
            .link(.rel(.appleTouchIcon), .sizes("152x152"), .href("/assets/favicons/apple-icon-152x152.png")),
            .link(.rel(.appleTouchIcon), .sizes("180x180"), .href("/assets/favicons/apple-icon-180x180.png")),
            .link(.rel(.icon), .type("image/png"), .sizes("16x16"), .href("/assets/favicons/favicon-16x16.png")),
            .link(.rel(.icon), .type("image/png"), .sizes("32x32"), .href("/assets/favicons/favicon-32x32.png")),
            .link(.rel(.icon), .type("image/png"), .sizes("96x96"), .href("/assets/favicons/favicon-96x96.png")),
            .link(.rel(.icon), .type("image/png"), .sizes("192x192"), .href("/assets/favicons/android-icon-192x192.png"))
        )
    }
}
