---
title: SwiftData, pre-seed database
date: 2024-02-26 05:00
description: SwiftData, pre-seed database
tags: swift, swiftdata
---

I started developing a new app, and it's been an exciting journey so far. Recently, I've begun utilising SwiftData, which is proving to be a fantastic tool for managing data within the app. It's been a smooth transition from CoreData.

Below is an example of how you can pre-seed your database using SwiftData.

Country.swift that is `Codable`:

```swift
import SwiftData

@Model
class Country: Codable {
    enum CodingKeys: CodingKey {
        case id
        case name
        case continent
    }

    var id: String = ""
    var name: String = ""
    var continent: String = ""

    init(id: String, name: String, continent: String) {
        self.id = id
        self.name = name
        self.continent = continent
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.continent = try container.decode(String.self, forKey: .continent)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(continent, forKey: .continent)
    }
}
```



In App.swift add this to your window group where you also added your modelContainer (`.modelContainer(sharedModelContainer)`).


```swift
.modelContainer(for: Country.self) { result in
    do {
        let container = try result.get()

        // Check we haven't already added our countries.
        let descriptor = FetchDescriptor<Country>()
        let existingCountries = try container.mainContext.fetchCount(descriptor)
        guard existingCountries == 0 else { return }

        // Load and decode the JSON.
        guard let url = Bundle.main.url(forResource: "countries", withExtension: "json") else {
            fatalError("Failed to find countries.json")
        }

        let data = try Data(contentsOf: url)
        let countries = try JSONDecoder().decode([Country].self, from: data)

        // Add all our data to the context.
        for country in countries {
            container.mainContext.insert(country)
        }
    } catch {
        print("Failed to pre-seed database.")
    }
}
```

<small><small>#100DaysToOffload 13/100</small></small>
