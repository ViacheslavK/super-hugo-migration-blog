+++
title = "Запрацювало!"
date = '2013-08-28T11:05:20+03:00'
author = "В'ячеслав Клевченя"
categories = ['автоматичні тести']
tags = ['C#','Page Object Pattern','WebDriver']
+++
Ура! Нарешті запрацювало!  
… або Переходимо до Page Object Pattern

… Вирішив переробити структуру проекту автотестів із “банального” (але працюючого!:)) варіанта  
**Constants &lt;- Helper &lt;- Test &lt;-Runners**  
в  
**Helper &lt;- Modules; Tests (Helper, Modules)**  
де **Modules** – окремі класи (файли) для різних сторінок програми, Tests (Helper, Modules) – окремі класи (файли) для тест-сьютів для кожного окремого модуля (сторінки), що використовують методи з базового класу Helper та спадкоємців Modules. Та ось невдача: знань з основ програмування на C# не вистачало. Після кількаденного танцю із бубнем та переписування всього, консультацій з хлопцями-програмістами з проекту вийшло ось що у файлі тестів

```sharp
{
    public TestsFirefox(): base(new FirefoxDriver())
    { }
}

public class TestsIE : TestsCases2TS
{
    public TestsIE(): base(new InternetExplorerDriver())
    { }
}

public TestsCases2TS(IWebDriver browser): this()
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
