//
//  SiteSection.swift
//  petercammeraat.net
//  BSD 3-Clause License
//  Copyright 2024 Peter Cammeraat
//

import Plot

struct SiteSection: ComponentContainer {
    @ComponentBuilder var content: ContentProvider

    var body: Component {
        HtmlSection(content: content)
    }
}

public extension Node where Context: HTML.BodyContext {
    func section(_ nodes: Node<HTML.BodyContext>...) -> Node {
        .element(named: "section", nodes: nodes)
    }
}

public enum ElementDefinitions {
    public enum HtmlSection: ElementDefinition { public static var wrapper = Node.section }
}

public typealias HtmlSection = ElementComponent<ElementDefinitions.HtmlSection>
