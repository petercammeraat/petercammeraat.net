---
title: How Quiet Network Filter works
date: 2021-05-14 05:00
description: How Quiet Network Filter works. uiet Network Filter examines user network content on-device as it passes through the network stack and determines if that content should be blocked or allowed to pass on to its final destination.
tags: projects, quiet
---

Quiet Network Filter examines user network content on-device as it passes through the network stack and determines if that content should be blocked or allowed to pass on to its final destination.

Quiet Network Filter consists of two parts that work in close cooperation: 

- Quiet app itself passes configuration information to the Quiet Network System Extension to allow that part to do its job. 
- Quiet Network System Extension receives user network content and examines that content to determine whether to block or allow it.

This separation exists to guarantee user privacy. Quiet Network System Extension runs in a very restrictive sandbox that prevents user network content from escaping.

By combining these parts, Quiet Network Filter has access to the network but cannot use that access to export user network content.
