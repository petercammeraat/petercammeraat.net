//
//  SiteFooter.swift
//  petercammeraat.net
//  BSD 3-Clause License
//  Copyright 2024 Peter Cammeraat
//

import Plot

struct SiteFooter: Component {
    var body: Component {
        Footer {
            HtmlSection {
                Navigation {
                    Link("Terms", url: "/terms/")
                    Link("Privacy", url: "/privacy/")
                    Link("Feeds", url: "/feeds/")
                    Link("Tags", url: "/tags/")
                }
                .class("footer-links")
            }
            .class("container")
        }
        .class("footer flex")
    }
}
