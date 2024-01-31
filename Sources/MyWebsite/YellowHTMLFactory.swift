//
//  YellowHTMLFactory.swift
//  petercammeraat.net
//  BSD 3-Clause License
//  Copyright 2024 Peter Cammeraat
//

import Foundation
import Plot
import Publish

struct YellowHTMLFactory<Site: Website>: HTMLFactory {
    func makeIndexHTML(for index: Index, context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .customHead(for: index, on: context.site),
            .body {
                SiteNavigation(context: context, selectedSelectionID: nil)
                Main {
                    SiteContainer {
                        SiteSection {
                            Div {
                                Paragraph(context.site.description)
                            }
                            .class("my")
                        }

                        SiteSection {
                            Div {
                                Link(url: "/projects/quiet", label: {
                                    Div {
                                        Div {
                                            Image(url: "/assets/quiet/quiet.png", description: "Quiet app icon")
                                        }
                                        .class("icon")

                                        Div {
                                            H3("Quiet")
                                            Paragraph("Quiet is a content blocker for Safari on iPhone, iPad, and Mac. It's time to reclaim your Safari browsing experience. It's time the internet was just a little more Quiet.")
                                                .class("description")
                                        }
                                    }
                                    .class("project")
                                })
                            }
                            .class("projects")
                        }
                    }

                    SiteContainer {
                        SiteSection {
                            H2("Latest entries")

                            let allEntries = context.allItems(sortedBy: \.date, order: .descending)
                            let lastFiveEntries = Array(allEntries[0...5])
                            ItemList(
                                items: lastFiveEntries,
                                site: context.site,
                                sectionID: Site.SectionID.init(rawValue: "journal")!
                            )
                        }
                    }
                }
                SiteFooter()
            }
        )
    }

    func makeSectionHTML(for section: Section<Site>, context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .customHead(for: section, on: context.site),
            .body {
                SiteNavigation(context: context, selectedSelectionID: section.id)
                Main {
                    SiteContainer {
                        Div(section.content.body)

                        if section.id.rawValue == "journal" {
                            ItemList(items: section.items, site: context.site, sectionID: section.id, separateInYears: true)
                        } else  {
                            ItemList(items: section.items, site: context.site, sectionID: section.id)
                        }
                    }
                }
                SiteFooter()
            }
        )
    }

    func makeItemHTML(for item: Item<Site>, context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .customHead(for: item, on: context.site),
            .body {
                SiteNavigation(context: context, selectedSelectionID: nil)
                Main {
                    SiteContainer {
                        Article {
                            Header {
                                H1(item.title)

                                Div {
                                    EntryDate(item: item, site: context.site)
                                    EntryTags(item: item, site: context.site)
                                }
                                .class("post-meta")
                            }
                            
                            Div(item.content.body).class("article-post")

                            Suggested(context: context, item: item)
                        }
                    }
                }
                SiteFooter()
            }
        )
    }

    func makePageHTML(for page: Page, context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .customHead(for: page, on: context.site),
            .body {
                SiteNavigation(context: context, selectedSelectionID: nil)
                Main {
                    SiteContainer {
                        Article {
                            Header {
                                H1(page.title)
                            }

                            Div(page.content.body).class("article-post")
                        }
                    }
                }
                SiteFooter()
            }
        )
    }

    func makeTagListHTML(for page: TagListPage, context: PublishingContext<Site>) throws -> HTML? {
        HTML(
            .lang(context.site.language),
            .customHead(for: page, on: context.site),
            .body {
                SiteNavigation(context: context, selectedSelectionID: nil)
                Main {
                    SiteSection {
                        SiteContainer {
                            Header {
                                H1("Tags")
                            }

                            Div {
                                for tag in page.tags.sorted() {
                                    Link(tag.string, url: context.site.path(for: tag).absoluteString)
                                }
                            }
                            .class("terms")
                        }
                    }
                }
                SiteFooter()
            }
        )
    }

    func makeTagDetailsHTML(for page: TagDetailsPage, context: PublishingContext<Site>) throws -> HTML? {
        HTML(
            .lang(context.site.language),
            .customHead(for: page, on: context.site),
            .body {
                SiteNavigation(context: context, selectedSelectionID: nil)
                Main {
                    Header {
                        SiteContainer {
                            H1(page.tag.string)

                            Paragraph {
                                Span(String(context.items(taggedWith: page.tag).count)).class("count")
                                Span(" found")
                            }
                            .class("subtitle")
                        }
                    }

                    SiteSection {
                        SiteContainer {
                            ItemList(
                                items: context.items(
                                    taggedWith: page.tag,
                                    sortedBy: \.date,
                                    order: .descending
                                ),
                                site: context.site,
                                sectionID: Site.SectionID.init(rawValue: "journal")!
                            )
                        }
                    }
                }
                SiteFooter()
            }
        )
    }
}
