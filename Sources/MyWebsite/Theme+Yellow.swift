//
//  Theme+Yellow.swift
//  petercammeraat.net
//  BSD 3-Clause License
//  Copyright 2024 Peter Cammeraat
//

import Publish
import Plot

public extension Theme {
    static var yellow: Self {
        Theme(
            htmlFactory: YellowHTMLFactory(),
            resourcePaths: ["Resources/theme/styles.css"]
        )
    }
}
