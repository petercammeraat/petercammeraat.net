//
//  ProjectList.swift
//  petercammeraat.net
//  BSD 3-Clause License
//  Copyright 2024 Peter Cammeraat
//

import Foundation
import Plot
import Publish


//struct ProjectList<MyWebsite: Website>: Component {
//    var items: [Item<MyWebsite>]
//
//    private var apps: [Item<MyWebsite>] {
//        items.filter( { $0.metadata.projectType == .app })
//    }
//
//    private var archived: [Item<MyWebsite>] {
//        items.filter( { $0.metadata.projectType == .archived })
//    }
//
//    var body: Component {
//        SiteSection {
//            listProjects(apps, title: "Apps")
//            Paragraph()
//            listProjects(archived, title: "Archived", subtitle: "Projects that are no longer with us today.")
//        }
//    }
//
//    private func listProjects(_ items: [Item<MyWebsite>], title: String, subtitle: String? = nil) -> Component {
//        return Div {
//            H2(title)
//
//            if let subtitle {
//                Paragraph(subtitle)
//            }
//
//            Div {
//                for item in items {
//                    Div {
//                        Link(url: item.path.absoluteString, label: {
//                            Div {
//                                H3(item.title)
//                                Paragraph(item.description)
//                            }
//                            .class("card-header")
//                        })
//                    }
//                    .class("card")
//                }
//            }
//            .class("projects")
//        }
//    }
//}
