//
//  SiteNavigation.swift
//  petercammeraat.net
//  BSD 3-Clause License
//  Copyright 2024 Peter Cammeraat
//

import Publish
import Plot

struct SiteNavigation<Site: Website>: Component {
    var context: PublishingContext<Site>
    var selectedSelectionID: Site.SectionID?

    var body: Component {
        Navigation {
            Div {
                Div {
                    Link(context.site.name, url: "https://petercammeraat.net")
                        .class("brand")

                    if Site.SectionID.allCases.count > 1 {
                        navigation
                    }
                }
                .class("flex")
            }
            .class("container")
        }
        .class("navbar")
    }

    private var navigation: Component {
        Div {

            for sectionID in Site.SectionID.allCases {
                let section = context.sections[sectionID]
                Link(section.title, url: section.path.absoluteString)
                    .class(sectionID == selectedSelectionID ? "selected" : "")
            }
        }
        .class("flex")
    }
}
