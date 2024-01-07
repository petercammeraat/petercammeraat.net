//
//  ItemList.swift
//  petercammeraat.net
//  BSD 3-Clause License
//  Copyright 2024 Peter Cammeraat
//

import Foundation
import Plot
import Publish

struct ItemList<Site: Website>: Component {
    var items: [Item<Site>]
    var site: Site
    var sectionID: Site.SectionID
    var separateInYears: Bool = false

    private var itemsFromSection: [Item<Site>] {
        items.filter( { $0.sectionID == sectionID })
    }

    let dateFormatter = DateFormatter()

    var body: Component {
        dateFormatter.dateFormat = "dd/MM"

        if separateInYears {
            return listWithYearSections()
        } else {
            return list()
        }
    }

    private func listWithYearSections() -> Component {
        let sectionsByYearSorted = createSectionsByYear(from: itemsFromSection).sorted(by: { $0.key > $1.key })

        return SiteSection {
            for (year, entries) in sectionsByYearSorted {
                H2(String(year))

                Div {
                    for entry in entries {
                        Div {
                            Link(url: entry.path.absoluteString, label: {
                                Div {
                                    Time(datetime: entry.date.ISO8601Format()) {
                                        Paragraph(dateFormatter.string(from: entry.date))
                                    }

                                    H3(entry.title)
                                }
                                .class("post-row")
                            })
                        }
                        .class("post")
                    }
                }
            }
        }
    }

    private func list() -> Component {
        return Div {
            for item in items where item.sectionID == sectionID {
                Div {
                    Link(url: item.path.absoluteString, label: {
                        Div {
                            Time(datetime: item.date.ISO8601Format()) {
                                Paragraph(dateFormatter.string(from: item.date))
                            }

                            H3(item.title)
                        }
                        .class("post-row")
                    })
                }
                .class("post")
            }
        }
        .class("posts")
    }

    private func createSectionsByYear(from items: [Item<Site>]) -> [Int: [Item<Site>]] {
        var sectionsByYear: [Int: [Item<Site>]] = [:]

        let calendar = Calendar.current

        for item in items {
            let year = calendar.component(.year, from: item.date)
            if sectionsByYear[year] == nil {
                sectionsByYear[year] = [item]
            } else {
                sectionsByYear[year]?.append(item)
            }
        }

        return sectionsByYear
    }
}
