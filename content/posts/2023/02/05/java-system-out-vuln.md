+++
title = "Java System Out Vuln"
publishDate = '2023-02-05T13:25:54+01:00'
author = "В'ячеслав Клевченя"
authorTwitter = "" #do not include @
cover = ""
tags = ["Java", "CVE", "Cybersecurity"]
keywords = ["", ""]
description = ""
showFullContent = false
readingTime = true
hideComments = false
color = "" #color from the theme settings
draft = true
+++

🔥🔥🔥Найдена уязвимость в методе `System.out.println()`. Чтобы добиться RCE нужно всего лишь выполнить `System.out.println()` с вредоносным `Object` с переопределением метода `toString()`.

🔥🔥🔥A vulnerability was found in the `System.out.println()` method. To achieve RCE, you just need to execute `System.out.println()` with a malicious `Object` with a redefinition of the `toString()` method.
