---
title: Запрацювало!
date: '2013-08-28T11:05:20+03:00'
status: publish
permalink: /2013/08/28/it-works-finally
author: 'В''ячеслав Клевченя'
excerpt: ''
type: post
id: 42
thumbnail: ../../../../../uploads/2014/11/test_icon1.jpg
category:
    - 'автоматичні тести'
tag:
    - 'C#'
    - 'Page Object Pattern'
    - WebDriver
post_format: []
dsq_thread_id:
    - '3635384970'
---
Ура! Нарешті запрацювало!  
… або Переходимо до Page Object Pattern

… Вирішив переробити структуру проекту автотестів із “банального” (але працюючого!:)) варіанта  
**Constants &lt;- Helper &lt;- Test &lt;-Runners**  
в  
**Helper &lt;- Modules; Tests (Helper, Modules)**  
де **Modules** – окремі класи (файли) для різних сторінок програми, Tests (Helper, Modules) – окремі класи (файли) для тест-сьютів для кожного окремого модуля (сторінки), що використовують методи з базового класу Helper та спадкоємців Modules. Та ось невдача: знань з основ програмування на C# не вистачало. Після кількаденного танцю із бубнем та переписування всього, консультацій з хлопцями-програмістами з проекту вийшло ось що у файлі тестів

```
<pre data-wpae="lang:csharp;" style="background-color: #ddd;">public class TestsFirefox : TestsCases2TS
{
public TestsFirefox()
: base(new FirefoxDriver())
{ }
}
public class TestsIE : TestsCases2TS
{
public TestsIE()
: base(new InternetExplorerDriver())
{ }
}

public TestsCases2TS(IWebDriver browser)
: this()
{
Helper.driver = browser;
}

public TestsCases2TS()
{
myHelper = new Helper();
myModule = new Module();
myHelper.baseURL = Helper.testServerBaseUrl;
myHelper.verificationErrors = new StringBuilder();
}
public Helper myHelper { get; set; }
public Module myModule { get; set; }
```

І ось ЦЕ запрацювало!:) (власне, описи тестів та методів у самих файлах залишилися майже без змін)

Але більш докладно розібратися з конструкторами, інкапсуляцією та іншими радощами реалізації ООП в C# мені ще належить…

<div id="gtx-trans" style="position: absolute; left: 205px; top: 318px;"><div class="gtx-trans-icon"></div></div>