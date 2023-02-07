+++
title = 'Drupal 7.35 &#8211; оновлення безпеки'
publishDate = '2015-03-19T14:25:37+02:00'
author = "В'ячеслав Клевченя"
categories = ['веб додатки']
tags = ['Drupal']
+++
Вийшло оновлення Drupal 7.35, яке включає фікси безпеки.

Опис з [офіційного сайту](https://www.drupal.org):

**Description**  
**Access bypass (Password reset URLs – Drupal 6 and 7)**

Password reset URLs can be forged under certain circumstances, allowing an attacker to gain access to another user’s account without knowing the account’s password.

In Drupal 7, this vulnerability is mitigated by the fact that it can only be exploited on sites where accounts have been imported or programmatically edited in a way that results in the password hash in the database being the same for multiple user accounts. In Drupal 6, it can additionally be exploited on sites where administrators have created multiple new user accounts with the same password via the administrative interface, or where accounts have been imported or programmatically edited in a way that results in the password hash in the database being empty for at least one user account.

Drupal 6 sites that have empty password hashes, or a password field with a guessable string in the database, are especially prone to this vulnerability. This could apply to sites that use external authentication so that the password field is set to a fixed, invalid value.

## Drupal

## Open redirect (Several vectors including the “destination” URL parameter – Drupal 6 and 7)

Drupal core and contributed modules frequently use a “destination” query string parameter in URLs to redirect users to a new destination after completing an action on the current page. Under certain circumstances, malicious users can use this parameter to construct a URL that will trick users into being redirected to a 3rd party website, thereby exposing the users to potential social engineering attacks.

In addition, several URL-related API functions in Drupal 6 and 7 can be tricked into passing through external URLs when not intending to, potentially leading to additional open redirect vulnerabilities.

This vulnerability is mitigated by the fact that many common uses of the “destination” parameter are not susceptible to the attack. However, all confirmation forms built using Drupal 7’s form API are vulnerable via the Cancel action that appears at the bottom of the form, and some Drupal 6 confirmation forms are vulnerable too.
